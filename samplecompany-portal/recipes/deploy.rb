#
# Cookbook Name:: samplecompany-portal
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-portal::init_attributes"

deploy_branch node['samplecompany-portal']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-portal']['git_repository']
  ssh_wrapper                 node['samplecompany-portal']['github_ssh_wrapper']
  revision                    node['samplecompany-portal']['git_branch']
  action                      :deploy
  purge_before_symlink([])
  create_dirs_before_symlink([])
  symlink_before_migrate({})
  symlinks({})
end

# Set correct permissions to application's directories
include_recipe "samplecompany-portal::dirs_permissions"

# Create cache directory
include_recipe "samplecompany-portal::create_dirs"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Generate translations files
include_recipe "samplecompany-portal::generate_translations"