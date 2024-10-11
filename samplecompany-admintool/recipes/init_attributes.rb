#
# Cookbook Name:: samplecompany-admintool
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                   = search("aws_opsworks_app", "shortname:admintool").first

# Environment configuration
node.chef_environment                                                 = app['environment']['APP_ENV']

# App data
node.default['samplecompany-admintool']['app_dir']                    = "/#{app['attributes']['document_root']}"

# Webserver configuration
node.default['samplecompany-admintool']['server_name']                = app['domains']
node.default['samplecompany-admintool']['server_main_name']           = app['domains'][0]
node.default['samplecompany-admintool']['kohana_env']                 = node.chef_environment.upcase

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-admintool']['git_branch']             = "dev"
  when "production"
    node.default['samplecompany-admintool']['git_branch']             = "master"
end
node.default['samplecompany-admintool']['git_branch']                 = app['app_source']['revision'] if !app['app_source']['revision'].nil?

node.default['samplecompany-admintool']['git_repository']             = app['app_source']['url']
node.default['samplecompany-admintool']['ssh_key_content']            = app['app_source']['ssh_key']

# Nginx FastCGI configuration
node.normal['samplecompany-webserver']['fastcgi_connect_timeout']     = node['samplecompany-admintool']['fastcgi_connect_timeout']
node.normal['samplecompany-webserver']['fastcgi_read_timeout']        = node['samplecompany-admintool']['fastcgi_read_timeout']