#
# Cookbook Name:: samplecompany-adminold
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                           = search("aws_opsworks_app", "shortname:adminold").first

# App data
node.default['samplecompany-adminold']['app_dir']             = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-adminold']['server_name']         = app['domains']
node.default['samplecompany-adminold']['server_main_name']    = app['domains'][0]

# GIT configuration
node.default['samplecompany-adminold']['git_branch']          = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-adminold']['git_repository']      = app['app_source']['url']
node.default['samplecompany-adminold']['ssh_key_content']     = app['app_source']['ssh_key']