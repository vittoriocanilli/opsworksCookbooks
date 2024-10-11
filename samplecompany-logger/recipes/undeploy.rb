#
# Cookbook Name:: samplecompany-logger
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-logger::init_attributes"

# Delete application's folder
directory node['samplecompany-logger']['app_dir'] do
  action        :delete
  recursive     true
end