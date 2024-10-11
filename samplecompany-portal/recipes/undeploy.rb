#
# Cookbook Name:: samplecompany-portal
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-portal::init_attributes"

# Delete application's folder
directory node['samplecompany-portal']['app_dir'] do
  action        :delete
  recursive     true
end