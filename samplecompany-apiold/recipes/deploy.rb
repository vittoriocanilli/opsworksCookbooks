#
# Cookbook Name:: samplecompany-apiold
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-apiold::init_attributes"

deploy_branch node['samplecompany-apiold']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-apiold']['git_repository']
  ssh_wrapper                 node['samplecompany-apiold']['github_ssh_wrapper']
  revision                    node['samplecompany-apiold']['git_branch']
  action                      :deploy
  
  before_symlink do
    
    link node['samplecompany-apiold']['conf_dir'] do
      to "#{File.join("#{release_path}", node['samplecompany-apiold']['app_sub_dir'], 'conf')}"
    end
    
    directory File.dirname(node['samplecompany-apiold']['api_dir']) do
      action :create
      recursive true
      owner "root"
      group "root"
      mode 0777
    end
    
    link node['samplecompany-apiold']['api_dir'] do
      to "#{File.join("#{release_path}", node['samplecompany-apiold']['app_sub_dir'], 'www', 'api')}"
    end
  end
  
  before_restart do
    gadget_dir = "gadget"
    gadget_dir += "_dev" if node.chef_environment == "staging"
    # Create the symlink to Gadget if ApiOld was deployed
    if !File.symlink? "#{File.join(node['samplecompany-apiold']['api_dir'], gadget_dir)}"
      link "#{File.join(node['samplecompany-apiold']['api_dir'], gadget_dir)}" do
        to "#{File.join(node['samplecompany-gadget']['app_dir'], "current", "app", "layout")}"
      end
    end
  end
end

# Configure Memcached
include_recipe "samplecompany-apiold::memcached_config"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"