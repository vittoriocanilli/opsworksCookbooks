#
# Cookbook Name:: samplecompany-logger
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory  node['samplecompany-logger']['log_dir'] do
  owner   "root"
  group   "root"
  mode    0755
  action  :create
end