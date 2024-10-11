#
# Cookbook Name:: samplecompany-logger
# Recipe:: git_remove
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Delete private SSH key
file "#{node['samplecompany-logger']['ssh_dir_path']}/#{node['samplecompany-logger']['ssh_key']}" do
	action :delete
end

# Delete public SSH key
file "#{node['samplecompany-logger']['ssh_dir_path']}/#{node['samplecompany-logger']['ssh_key']}.pub" do
	action :delete
end

# Delete SSH wrapper
file node['samplecompany-logger']['github_ssh_wrapper'] do
	action :delete
end

