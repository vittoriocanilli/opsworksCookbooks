#
# Cookbook Name:: samplecompany-revive
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-revive::init_attributes"

# Delete application's folder
directory node['samplecompany-revive']['app_dir'] do
  action        :delete
  recursive     true
end