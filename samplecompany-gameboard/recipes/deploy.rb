#
# Cookbook Name:: samplecompany-gameboard
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-gameboard::init_attributes"

deploy_branch node['samplecompany-gameboard']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-gameboard']['git_repository']
  ssh_wrapper                 node['samplecompany-gameboard']['github_ssh_wrapper']
  revision                    node['samplecompany-gameboard']['git_branch']
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
        :laravel_env => node['samplecompany-gameboard']['laravel_env'],
        :debug_mode => node['samplecompany-gameboard']['debug_mode'],
        :game_db_host => node['samplecompany-gameboard']['game_db_host'],
        :game_db_name => node['samplecompany-gameboard']['game_db_name'],
        :app_db_host => node['samplecompany-gameboard']['app_db_host'],
        :app_db_name => node['samplecompany-gameboard']['app_db_name'],
        :game_s3_folder => node['samplecompany-gameboard']['game_s3_folder'],
        :game_url => node['samplecompany-gameboard']['game_url'],
        :opsworks_game_stack_id => node['samplecompany-gameboard']['opsworks_game_stack_id'],
        :opsworks_game_app_id => node['samplecompany-gameboard']['opsworks_game_app_id'],
        :elasticache_memcache_game_cluster_id => node['samplecompany-gameboard']['elasticache_memcache_game_cluster_id'],
        :elasticache_memcache_common_cluster_id => node['samplecompany-gameboard']['elasticache_memcache_common_cluster_id']
       )
    end
  end
end

# Set correct permissions to application's directories
include_recipe "samplecompany-gameboard::dirs_permissions"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"