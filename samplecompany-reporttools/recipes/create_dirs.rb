#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory File.dirname(node['samplecompany-reporttools']['jar_dir']) do
  action :create
  recursive true
  owner "root"
  group "root"
  mode 0755
end

directory node['samplecompany-reporttools']['jar_dir'] do
  action :create
  recursive true
  owner "root"
  group "root"
  mode 0755
end

directory node['samplecompany-reporttools']['cron_dir'] do
  action :create
  recursive true
  owner "root"
  group "root"
  mode 0755
end