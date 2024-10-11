#
# Cookbook Name:: samplecompany-portal
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory File.join(node['samplecompany-portal']['app_dir'], 'current', 'data') do
  action    :delete
  recursive true
end

directory File.join(node['samplecompany-portal']['app_dir'], 'current', 'data') do
  action    :create
  recursive true
  owner     'root'
  group     'root'
  mode      00777
end