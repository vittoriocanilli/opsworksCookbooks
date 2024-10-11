#
# Cookbook Name:: samplecompany-kernel
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-kernel::init_attributes"

deploy_branch node['samplecompany-kernel']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-kernel']['git_repository']
  ssh_wrapper                 node['samplecompany-kernel']['github_ssh_wrapper']
  revision                    node['samplecompany-kernel']['git_branch']
  action                      :deploy
  
  before_symlink do
    execute "Installing dependencies with Composer" do
      command "composer install"
      cwd "#{release_path}"
    end
    template "#{release_path}/.env" do
      source  "env.erb"
      owner   node['nginx']['user']
      group   node['nginx']['user']
      mode    00755
      variables(
        :laravel_env => node['samplecompany-kernel']['laravel_env'],
        :debug_mode => node['samplecompany-kernel']['debug_mode']
       )
    end
  end
end

# Set correct permissions to application's directories
include_recipe "samplecompany-kernel::dirs_permissions"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"