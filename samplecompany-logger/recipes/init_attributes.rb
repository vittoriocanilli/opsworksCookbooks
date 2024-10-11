#
# Cookbook Name:: samplecompany-logger
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                     = search("aws_opsworks_app", "shortname:logger").first

# Web app data
node.default['samplecompany-logger']['app_dir']         = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-logger']['server_name']     = app['domains']
node.default['samplecompany-logger']['lb_name']         = app['domains'][0]

# GIT configuration
node.default['samplecompany-logger']['git_branch']      = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-logger']['git_repository']  = app['app_source']['url']
node.default['samplecompany-logger']['ssh_key_content'] = app['app_source']['ssh_key']

# SSL configuration
node.default['samplecompany-logger']['ssl_crt']         = app['ssl_configuration']['certificate']
node.default['samplecompany-logger']['ssl_ca']          = app['ssl_configuration']['chain']
node.default['samplecompany-logger']['ssl_key']         = app['ssl_configuration']['private_key']