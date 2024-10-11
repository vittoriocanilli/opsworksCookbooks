#
# Cookbook Name:: samplecompany-common
# Recipe:: git_remove
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Delete private SSH key
file "#{node['samplecompany-common']['ssh_dir_path']}/#{node['samplecompany-common']['ssh_key']}" do
	action :delete
end

# Delete public SSH key
file "#{node['samplecompany-common']['ssh_dir_path']}/#{node['samplecompany-common']['ssh_key']}.pub" do
	action :delete
end

# Delete SSH wrapper
file node['samplecompany-common']['github_ssh_wrapper'] do
	action :delete
end

