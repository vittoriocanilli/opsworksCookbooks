#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                = search("aws_opsworks_app", "shortname:trackingbackend").first

# App data
node.default['samplecompany-trackingbackend']['app_dir']           = "/#{app['attributes']['document_root']}"

# GIT configuration
node.default['samplecompany-trackingbackend']['git_branch']        = if !app['app_source']['revision'].nil? then app['app_source']['revision'] else "master" end
node.default['samplecompany-trackingbackend']['git_repository']    = app['app_source']['url']
node.default['samplecompany-trackingbackend']['ssh_key_content']   = app['app_source']['ssh_key']