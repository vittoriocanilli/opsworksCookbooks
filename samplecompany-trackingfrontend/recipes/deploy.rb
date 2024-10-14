#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingfrontend::init_attributes"

execute "Stop Node.js server" do
  command "forever stopall"
  cwd File.join(node['samplecompany-trackingfrontend']['app_dir'], 'current')
end

deploy_branch node['samplecompany-trackingfrontend']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-trackingfrontend']['git_repository']
  ssh_wrapper                 node['samplecompany-trackingfrontend']['github_ssh_wrapper']
  revision                    node['samplecompany-trackingfrontend']['git_branch']
  action                      :deploy
  
  before_symlink do
    # Compile coffee
    execute "Compile server" do
      command "coffee -c #{release_path}/server.coffee"
    end
    
    execute "Compile libraries" do
      command "coffee -c #{release_path}/lib"
    end
    
    install_command = "cd #{release_path} && npm install"
    update_command = "cd #{release_path} && npm update"
    
    # Install and update packages
    execute "Install packages" do
      command install_command
    end
    execute "Update packages" do
      command update_command
    end
  end
  
  before_restart do
    # Create console's log
    directory File.join(release_path, "log") do
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end
    file File.join(release_path, "log", "node.log") do
      mode '0755'
      owner 'root'
      group 'root'
      action :touch
    end
  end
end

forever_logs = "-a -l #{File.join(node['samplecompany-trackingfrontend']['log_dir'], "forever.log")}"
forever_logs << " -o #{File.join(node['samplecompany-trackingfrontend']['log_dir'], "out.log")}"
forever_logs << " -e #{File.join(node['samplecompany-trackingfrontend']['log_dir'], "error.log")}"
execute "Start Node.js server" do
  command "forever start #{forever_logs} server.js"
  cwd File.join(node['samplecompany-trackingfrontend']['app_dir'], 'current')
end