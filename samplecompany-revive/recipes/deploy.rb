#
# Cookbook Name:: samplecompany-revive
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-revive::init_attributes"

deploy_branch node['samplecompany-revive']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-revive']['git_repository']
  ssh_wrapper                 node['samplecompany-revive']['github_ssh_wrapper']
  revision                    node['samplecompany-revive']['git_branch']
  action                      :deploy
  
  before_symlink do
    cron "revive run maintenance processes" do
      minute "0"
      command "php #{release_path}/scripts/maintenance/maintenance.php #{node['samplecompany-revive']['lb_name']}"
    end
  end
end

# Create configuration files
include_recipe "samplecompany-revive::create_conf_files"

# Set correct permissions to application's directories
include_recipe "samplecompany-revive::dirs_permissions"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"