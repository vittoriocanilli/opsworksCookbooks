#
# Cookbook Name:: samplecompany-corporate
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-corporate::init_attributes"

deploy_branch node['samplecompany-corporate']['app_dir'] do
  action             :deploy
  enable_submodules  false
  user               "root"
  group              "root"
  repository         node['samplecompany-corporate']['git_repository']
  ssh_wrapper        node['samplecompany-corporate']['github_ssh_wrapper']
  revision           node['samplecompany-corporate']['git_branch']
  purge_before_symlink([])
  create_dirs_before_symlink([])
  symlink_before_migrate({})
  symlinks({})
end

# Set correct permissions to application's directories
include_recipe "samplecompany-corporate::dirs_permissions"