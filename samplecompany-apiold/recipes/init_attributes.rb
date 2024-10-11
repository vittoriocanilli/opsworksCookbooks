#
# Cookbook Name:: samplecompany-apiold
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                = search("aws_opsworks_app", "shortname:apiold").first

# Environment configuration
node.chef_environment                                              = app['environment']['APP_ENV']

# App data
node.default['samplecompany-apiold']['app_dir']                    = "/#{app['attributes']['document_root']}"
case node.chef_environment
  when "staging"
    node.default['samplecompany-apiold']['app_sub_dir']            = "dev"
  when "production"
    node.default['samplecompany-apiold']['app_sub_dir']            = "live"
end

# Webserver configuration
node.default['samplecompany-apiold']['server_name']                = app['domains']
node.default['samplecompany-apiold']['lb_name']                    = app['domains'][0]

# GIT configuration
node.default['samplecompany-apiold']['git_branch']                 = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-apiold']['git_repository']             = app['app_source']['url']
node.default['samplecompany-apiold']['ssh_key_content']            = app['app_source']['ssh_key']

# SSL configuration
node.default['samplecompany-apiold']['ssl_crt']                    = app['ssl_configuration']['certificate']
node.default['samplecompany-apiold']['ssl_ca']                     = app['ssl_configuration']['chain']
node.default['samplecompany-apiold']['ssl_key']                    = app['ssl_configuration']['private_key']

# PHP Errors Configuration
if node.chef_environment == "production"
  node.normal['samplecompany-webserver']['php_error_reporting']    = "E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED & ~E_STRICT"
end