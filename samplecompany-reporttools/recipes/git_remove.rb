#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: git_remove
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-reporttools::init_attributes"

# Delete private SSH key
file "#{node['samplecompany-reporttools']['ssh_dir_path']}/#{node['samplecompany-reporttools']['ssh_key']}" do
	action :delete
end

# Delete public SSH key
file "#{node['samplecompany-reporttools']['ssh_dir_path']}/#{node['samplecompany-reporttools']['ssh_key']}.pub" do
	action :delete
end

# Delete SSH wrapper
file node['samplecompany-reporttools']['github_ssh_wrapper'] do
	action :delete
end

