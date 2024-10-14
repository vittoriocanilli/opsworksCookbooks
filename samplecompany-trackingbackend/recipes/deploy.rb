#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingbackend::init_attributes"

deploy_branch node['samplecompany-trackingbackend']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-trackingbackend']['git_repository']
  ssh_wrapper                 node['samplecompany-trackingbackend']['github_ssh_wrapper']
  revision                    node['samplecompany-trackingbackend']['git_branch']
  action                      :deploy
  # Deploy hooks are in the project's repository
end

# Create log directory
directory File.join(node['samplecompany-trackingbackend']['app_dir'], 'current', 'log') do
  action    :create
  recursive true
  owner     'root'
  group     'root'
  mode      00755
end