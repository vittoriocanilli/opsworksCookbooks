#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingbackend::init_attributes"

# Delete application's folder
directory node['samplecompany-trackingbackend']['app_dir'] do
  action        :delete
  recursive     true
end