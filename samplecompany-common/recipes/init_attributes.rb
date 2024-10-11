#
# Cookbook Name:: samplecompany-common
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                            = search("aws_opsworks_app", "shortname:common").first

# Environment configuration
node.chef_environment                                          = app['environment']['APP_ENV']

# Web app data
node.default['samplecompany-common']['app_dir']                = "/#{app['attributes']['document_root']}"

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-common']['git_branch']         = "dev"
  when "production"
    node.default['samplecompany-common']['git_branch']         = "master"
end
node.default['samplecompany-common']['git_branch']             = app['app_source']['revision'] if !app['app_source']['revision'].nil?

node.default['samplecompany-common']['git_repository']         = app['app_source']['url']
node.default['samplecompany-common']['ssh_key_content']        = app['app_source']['ssh_key']
