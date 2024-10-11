#
# Cookbook Name:: samplecompany-portal
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                             = search("aws_opsworks_app", "shortname:portal").first

# Environment configuration
node.chef_environment                                                           = app['environment']['APP_ENV']

# App data
node.default['samplecompany-portal']['app_dir']                                 = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-portal']['server_name']                             = app['domains']
node.default['samplecompany-portal']['lb_name']                                 = app['domains'][0]
case node.chef_environment
  when "staging"
    node.default['samplecompany-portal']['server_alias']['farm_games']          = false
    node.default['samplecompany-portal']['server_alias']['action_games']        = false
  when "production"
    node.default['samplecompany-portal']['server_alias']['farm_games']          = "farm-games.com farmers-fun.com milk-the-cow.com"
    node.default['samplecompany-portal']['server_alias']['action_games']        = "action-games.com insane-games.com"
end

# App configuration
node.default['samplecompany-portal']['zend_env']                                = app['environment']['APP_ENV']

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-portal']['git_branch']                          = "dev"
  when "production"
    node.default['samplecompany-portal']['git_branch']                          = "master"
end
node.default['samplecompany-portal']['git_branch']                              = app['app_source']['revision'] if !app['app_source']['revision'].nil?
node.default['samplecompany-portal']['git_repository']                          = app['app_source']['url']
node.default['samplecompany-portal']['ssh_key_content']                         = app['app_source']['ssh_key']

# Nginx FastCGI configuration
node.normal['samplecompany-webserver']['fastcgi_read_timeout']                  = node['samplecompany-portal']['fastcgi_read_timeout']

# SSL configuration
node.default['samplecompany-portal']['ssl_crt']                                 = app['ssl_configuration']['certificate']
node.default['samplecompany-portal']['ssl_ca']                                  = app['ssl_configuration']['chain']
node.default['samplecompany-portal']['ssl_key']                                 = app['ssl_configuration']['private_key']