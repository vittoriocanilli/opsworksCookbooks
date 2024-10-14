#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                 = search("aws_opsworks_app", "shortname:trackingfrontend").first

# App data
node.default['samplecompany-trackingfrontend']['app_dir']           = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-trackingfrontend']['server_name']       = app['domains']
node.default['samplecompany-trackingfrontend']['lb_name']           = app['domains'][0]

# GIT configuration
node.default['samplecompany-trackingfrontend']['git_branch']        = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-trackingfrontend']['git_repository']    = app['app_source']['url']
node.default['samplecompany-trackingfrontend']['ssh_key_content']   = app['app_source']['ssh_key']

# SSL configuration
node.default['samplecompany-trackingfrontend']['ssl_crt']           = app['ssl_configuration']['certificate']
node.default['samplecompany-trackingfrontend']['ssl_ca']            = app['ssl_configuration']['chain']
node.default['samplecompany-trackingfrontend']['ssl_key']           = app['ssl_configuration']['private_key']