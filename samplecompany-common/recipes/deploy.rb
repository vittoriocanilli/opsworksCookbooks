#
# Cookbook Name:: samplecompany-common
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-common::init_attributes"

deploy_branch node['samplecompany-common']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-common']['git_repository']
  ssh_wrapper                 node['samplecompany-common']['github_ssh_wrapper']
  revision                    node['samplecompany-common']['git_branch']
  action                      :deploy
end

# Create json configuration in app directory
include_recipe "samplecompany-common::create_json"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"