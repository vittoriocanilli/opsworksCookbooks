#
# Cookbook Name:: samplecompany-kernel
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                      = search("aws_opsworks_app", "shortname:kernel").first

# Environment configuration
node.chef_environment                                    = app['environment']['APP_ENV']

# App data
node.default['samplecompany-kernel']['app_dir']          = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-kernel']['server_name']      = app['domains']

# App configuration
node.default['samplecompany-kernel']['laravel_env']      = node.chef_environment
node.default['samplecompany-kernel']['debug_mode']       = node.chef_environment != "production"

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-kernel']['git_branch']   = "dev"
  when "production"
    node.default['samplecompany-kernel']['git_branch']   = "master"
end
node.default['samplecompany-kernel']['git_branch']       = app['app_source']['revision'] if !app['app_source']['revision'].nil?
node.default['samplecompany-kernel']['git_repository']   = app['app_source']['url']
node.default['samplecompany-kernel']['ssh_key_content']  = app['app_source']['ssh_key']