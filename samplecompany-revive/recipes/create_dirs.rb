#
# Cookbook Name:: samplecompany-revive
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory  node['samplecompany-revive']['cache_dir'] do
  owner   "root"
  group   "root"
  mode    0777
  action  :create
end