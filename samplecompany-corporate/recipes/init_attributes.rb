#
# Cookbook Name:: samplecompany-corporate
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                   = search("aws_opsworks_app", "shortname:corporate").first

# Environment configuration
node.chef_environment                                                 = app['environment']['APP_ENV']

# App data
node.default['samplecompany-corporate']['app_dir']                    = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-corporate']['server_name']                = app['domains'][0]
node.default['samplecompany-corporate']['server_aliases']             = app['domains'][1]

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-corporate']['git_branch']             = "dev"
  when "production"
    node.default['samplecompany-corporate']['git_branch']             = "master"
end
node.default['samplecompany-corporate']['git_branch']                 = app['app_source']['revision'] if !app['app_source']['revision'].nil?

node.default['samplecompany-corporate']['git_repository']             = app['app_source']['url']
node.default['samplecompany-corporate']['ssh_key_content']            = app['app_source']['ssh_key']

# Apache2 configuration
node.normal['apache']['mpm']                                          = "prefork"

# SSL configuration
node.default['samplecompany-corporate']['ssl_crt']                    = app['ssl_configuration']['certificate']
node.default['samplecompany-corporate']['ssl_ca']                     = app['ssl_configuration']['chain']
node.default['samplecompany-corporate']['ssl_key']                    = app['ssl_configuration']['private_key']