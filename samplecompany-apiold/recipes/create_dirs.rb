#
# Cookbook Name:: samplecompany-apiold
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory node['samplecompany-apiold']['log_dir_target'] do
  action :create
  recursive true
  owner "www-data"
  group "www-data"
  mode 0755
end

link node['samplecompany-apiold']['log_dir'] do
  to node['samplecompany-apiold']['log_dir_target']
end