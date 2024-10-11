#
# Cookbook Name:: samplecompany-adminold
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-adminold::init_attributes"

# Delete application's folder
directory node['samplecompany-adminold']['app_dir'] do
  action        :delete
  recursive     true
end