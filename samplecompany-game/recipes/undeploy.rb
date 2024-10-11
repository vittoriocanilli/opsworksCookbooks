#
# Cookbook Name:: samplecompany-game
# Recipe:: undeploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

# Delete application's folder
directory node['samplecompany-game']['app_dir'] do
  action        :delete
  recursive     true
end