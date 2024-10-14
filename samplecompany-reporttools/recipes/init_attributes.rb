#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                           = search("aws_opsworks_app", "shortname:reporttools").first

# App data
node.default['samplecompany-reporttools']['app_dir']          = "/#{app['attributes']['document_root']}"

# GIT configuration
node.default['samplecompany-reporttools']['git_branch']       = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-reporttools']['git_repository']   = app['app_source']['url']
node.default['samplecompany-reporttools']['ssh_key_content']  = app['app_source']['ssh_key']