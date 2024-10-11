#
# Cookbook Name:: samplecompany-game
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                              = search("aws_opsworks_app", "shortname:game").first

# Environment configuration
node.chef_environment                                            = app['environment']['APP_ENV']

# App data
node.default['samplecompany-game']['app_dir']                    = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-game']['server_name']                = app['domains']
node.default['samplecompany-game']['lb_name']                    = app['domains'][0]
case node.chef_environment
  when "staging"
    node.default['samplecompany-game']['memcached']              = "game-dev.some.thing.euw1.cache.amazonaws.com"
    node.default['samplecompany-game']['memcached_sessions']     = "game-sessions-dev.some.thing.euw1.cache.amazonaws.com"
    node.default['samplecompany-game']['corporate_site']         = "0.0.0.0" # some IP address
    node.default['samplecompany-game']['network_1']              = "network1-dev.samplecompany.com"
    node.default['samplecompany-game']['network_2']              = "network2-dev.samplecompany.com"
    node.default['samplecompany-game']['network_3']              = "network3-dev.samplecompany.com"
    node.default['samplecompany-game']['network_4']              = "network4-dev.samplecompany.com"
  when "production"
    node.default['samplecompany-game']['memcached']              = "game-live.some.thing.euw1.cache.amazonaws.com"
    node.default['samplecompany-game']['memcached_sessions']     = "game-sessions-live.some.thing.euw1.cache.amazonaws.com"
    node.default['samplecompany-game']['corporate_site']         = "0.0.0.0" # some IP address
    node.default['samplecompany-game']['network_1']              = "network1-live.samplecompany.com"
    node.default['samplecompany-game']['network_2']              = "network2-live.samplecompany.com"
    node.default['samplecompany-game']['network_3']              = "network3-live.samplecompany.com"
    node.default['samplecompany-game']['network_4']              = "network4-live.samplecompany.com"
end

# App configuration
node.default['samplecompany-game']['kohana_env']                 = node.chef_environment.upcase
node.default['samplecompany-game']['maintenance']                = app['environment']['MAINTENANCE'].upcase

# OGH Portal configuration
node.default['samplecompany-game']['portal_languages']           = ["en", "de", "es", "fr", "el", "it", "nl", "pl", "pt", "ru"]
node.default['samplecompany-game']['portal_ip']                  = "0.0.0.0" # some IP address

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-game']['git_branch']             = "dev"
  when "production"
    node.default['samplecompany-game']['git_branch']             = "master"
end
node.default['samplecompany-game']['git_branch']                 = app['app_source']['revision'] if !app['app_source']['revision'].nil?
node.default['samplecompany-game']['git_repository']             = app['app_source']['url']
node.default['samplecompany-game']['ssh_key_content']            = app['app_source']['ssh_key']

# SSL configuration
node.default['samplecompany-game']['ssl_crt']                    = app['ssl_configuration']['certificate']
node.default['samplecompany-game']['ssl_ca']                     = app['ssl_configuration']['chain']
node.default['samplecompany-game']['ssl_key']                    = app['ssl_configuration']['private_key']

# Session Configuration
node.normal['samplecompany-webserver']['fpm_session_save_handler']     = "session.save_handler = memcache"
node.normal['samplecompany-webserver']['fpm_session_save_path']        = "session.save_path = \"tcp://#{node['samplecompany-game']['memcached']}:11211?persistent=1&weight=1&timeout=1&retry_interval=15\""
node.normal['samplecompany-webserver']['cli_session_save_handler']     = "session.save_handler = memcache"
node.normal['samplecompany-webserver']['cli_session_save_path']        = "session.save_path = \"tcp://#{node['samplecompany-game']['memcached_sessions']}:11211?persistent=1&weight=1&timeout=1&retry_interval=15\""