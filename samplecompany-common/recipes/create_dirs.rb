#
# Cookbook Name:: samplecompany-common
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment == "staging"
  directory  node['samplecompany-common']['log_dir'] do
    owner "root"
    group "root"
    mode 0777
    action :create
  end
end