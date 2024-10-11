#
# Cookbook Name:: samplecompany-gameboard
# Recipe:: git_remove
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-gameboard::init_attributes"

# Delete private SSH key
file "#{node['samplecompany-gameboard']['ssh_dir_path']}/#{node['samplecompany-gameboard']['ssh_key']}" do
	action :delete
end

# Delete public SSH key
file "#{node['samplecompany-gameboard']['ssh_dir_path']}/#{node['samplecompany-gameboard']['ssh_key']}.pub" do
	action :delete
end

# Delete SSH wrapper
file node['samplecompany-gameboard']['github_ssh_wrapper'] do
	action :delete
end

