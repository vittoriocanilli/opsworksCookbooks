#
# Cookbook Name:: samplecompany-game
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory node[:"samplecompany-game"][:log_dir] do
  action :create
  recursive true
  mode '0755'
  owner node['nginx']['user']
  group node['nginx']['user']
end

directory node[:"samplecompany-game"][:cache_dir] do
  action :create
  recursive true
  mode '0755'
  owner node['nginx']['user']
  group node['nginx']['user']
end