#
# Cookbook Name:: samplecompany-adminold
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-adminold::init_attributes"

deploy_branch node['samplecompany-adminold']['app_dir'] do
  action             :deploy
  enable_submodules  false
  user               "root"
  group              "root"
  repository         node['samplecompany-adminold']['git_repository']
  ssh_wrapper        node['samplecompany-adminold']['github_ssh_wrapper']
  revision           node['samplecompany-adminold']['git_branch']
  purge_before_symlink([])
  create_dirs_before_symlink([])
  symlink_before_migrate({})
  symlinks({})
  
  before_symlink do
    directory File.dirname(node['samplecompany-adminold']['adminold_dir']) do
      action :create
      recursive true
      owner "root"
      group "root"
      mode 0755
    end
    
    link node['samplecompany-adminold']['adminold_dir'] do
      to "#{File.join("#{release_path}", 'live', 'www', 'admin')}"
    end
    
    directory File.dirname(node['samplecompany-adminold']['reporting_dir']) do
      action :create
      recursive true
      owner "root"
      group "root"
      mode 0755
    end
    
    link node['samplecompany-adminold']['reporting_dir'] do
      to "#{File.join("#{release_path}", 'live', 'www', 'admin', 'reporting')}"
    end
    
    link node['samplecompany-apiold']['conf_dir'] do
      to "#{File.join("#{release_path}", 'live', 'conf')}"
    end
    
    link node['samplecompany-apiold']['api_dir'] do
      to "#{File.join("#{release_path}", 'live', 'www', 'api')}"
    end
  end
end

#execute "Set permissions for the app" do
#  cwd         "#{node['samplecompany-adminold']['app_dir']}/current"
#  command     "chmod -R 755 ."
#end

# Create log and cache directories
#include_recipe "samplecompany-adminold::create_dirs"

# Configure Memcached
include_recipe "samplecompany-apiold::memcached_config"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"