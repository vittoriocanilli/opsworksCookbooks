#
# Cookbook Name:: samplecompany-gameboard
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                                   = search("aws_opsworks_app", "shortname:gameboard").first

# Environment configuration
node.chef_environment                                                                 = app['environment']['APP_ENV']

# App data
node.default['samplecompany-gameboard']['app_dir']                                    = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-gameboard']['server_name']                                = app['domains']

# App configuration
node.default['samplecompany-gameboard']['laravel_env']                                = node.chef_environment
node.default['samplecompany-gameboard']['debug_mode']                                 = node.chef_environment != "production"
case node.chef_environment
  when "staging"
    node.default['samplecompany-gameboard']['game_db_host']                           = "game-dev.something.eu-west-1.rds.amazonaws.com"
    node.default['samplecompany-gameboard']['game_db_name']                           = "game_db"
    node.default['samplecompany-gameboard']['app_db_host']                            = "admintool.something.eu-west-1.rds.amazonaws.com"
    node.default['samplecompany-gameboard']['app_db_name']                            = "gameboard_dev"
    node.default['samplecompany-gameboard']['game_s3_folder']                         = "game_dev"
    node.default['samplecompany-gameboard']['game_url']                               = "http://game-dev.samplecompany.com"
    node.default['samplecompany-gameboard']['opsworks_game_stack_id']                 = "s0m3-0p5w0rk5-1d-1"
    node.default['samplecompany-gameboard']['opsworks_game_app_id']                   = "s0m3-0p5w0rk5-1d-2"
    node.default['samplecompany-gameboard']['elasticache_memcache_game_cluster_id']   = "game-dev"
    node.default['samplecompany-gameboard']['elasticache_memcache_common_cluster_id'] = ""
  when "production"
    node.default['samplecompany-gameboard']['game_db_host']                           = "game-live.something.eu-west-1.rds.amazonaws.com"
    node.default['samplecompany-gameboard']['game_db_name']                           = "game_db"
    node.default['samplecompany-gameboard']['app_db_host']                            = "admintool.something.eu-west-1.rds.amazonaws.com"
    node.default['samplecompany-gameboard']['app_db_name']                            = "gameboard_live"
    node.default['samplecompany-gameboard']['game_s3_folder']                         = "game"
    node.default['samplecompany-gameboard']['game_url']                               = "http://www.samplecompany.com"
    node.default['samplecompany-gameboard']['opsworks_game_stack_id']                 = "s0m3-0p5w0rk5-1d-3"
    node.default['samplecompany-gameboard']['opsworks_game_app_id']                   = "s0m3-0p5w0rk5-1d-4"
    node.default['samplecompany-gameboard']['elasticache_memcache_game_cluster_id']   = "game-live"
    node.default['samplecompany-gameboard']['elasticache_memcache_common_cluster_id'] = "common-t2-small"
end

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-gameboard']['git_branch']                             = "dev"
  when "production"
    node.default['samplecompany-gameboard']['git_branch']                             = "master"
end
node.default['samplecompany-gameboard']['git_branch']                                 = app['app_source']['revision'] if !app['app_source']['revision'].nil?
node.default['samplecompany-gameboard']['git_repository']                             = app['app_source']['url']
node.default['samplecompany-gameboard']['ssh_key_content']                            = app['app_source']['ssh_key']