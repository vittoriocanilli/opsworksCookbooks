#
# Cookbook Name:: samplecompany-gadget
# Recipe:: init_attributes
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
app                                                                = search("aws_opsworks_app", "shortname:gadget").first

# Environment configuration
node.chef_environment                                              = app['environment']['APP_ENV']

# App data
node.default['samplecompany-gadget']['app_dir']                    = "/#{app['attributes']['document_root']}"

# GIT configuration
case node.chef_environment
  when "staging"
    node.default['samplecompany-gadget']['git_branch']             = "dev"
  when "production"
    node.default['samplecompany-gadget']['git_branch']             = "master"
end
node.default['samplecompany-gadget']['git_branch']                 = app['app_source']['revision'] if !app['app_source']['revision'].nil?
node.default['samplecompany-gadget']['git_repository']             = app['app_source']['url']
node.default['samplecompany-gadget']['ssh_key_content']            = app['app_source']['ssh_key']