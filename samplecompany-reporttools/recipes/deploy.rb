#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-reporttools::init_attributes"

deploy_branch node['samplecompany-reporttools']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-reporttools']['git_repository']
  ssh_wrapper                 node['samplecompany-reporttools']['github_ssh_wrapper']
  revision                    node['samplecompany-reporttools']['git_branch']
  action                      :deploy
  
  before_migrate do
    execute "Delete previous JAR archive and compiled files" do
      command "rm -rf *"
      cwd node['samplecompany-reporttools']['jar_dir']
    end
  end
  
  before_restart do
    execute "Compile Java project" do
      command "javac -cp '#{File.join(release_path, 'lib', '*')}' -d #{node['samplecompany-reporttools']['jar_dir']} -encoding ISO-8859-1 src/*/*.java"
      cwd release_path
    end
    
    ["files", "xlsx"].each do |folder|
      directory File.join(node['samplecompany-reporttools']['jar_dir'], folder) do
        action :create
        recursive true
        owner "root"
        group "root"
        mode 0755
      end
      
      execute "Copy data from #{folder} directory" do
        command "cp #{File.join(release_path, 'src', folder, '*')} #{File.join(node['samplecompany-reporttools']['jar_dir'], folder)}"
        cwd release_path
      end
      
    end
    
    execute "Create JAR archive" do
      command "jar cfe reporttools.jar schedulers.ReportSchedulerJob ./*/*"
      cwd node['samplecompany-reporttools']['jar_dir']
    end
  end
end

