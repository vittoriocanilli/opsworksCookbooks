#
# Cookbook Name:: samplecompany-common
# Recipe:: create_json
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-common::init_attributes"

# Environment configuration
environment = nil
case node.chef_environment
when "production"
  environment = "LIVE"
when "staging"
  environment = "DEV"
end

current_rev_dir = File.join(node['samplecompany-common']['app_dir'], 'current/')

# Creates a config-environment.json file
if !environment.nil?
  file File.join(current_rev_dir,"app/config-environment.json") do
    mode "0644"
    action :create
    content environment.to_json
    only_if do
      File.exists?(current_rev_dir)
    end
  end
end

# Memcached configuration file
memcached_server_ips = node['samplecompany-common']['memcached']

file File.join(current_rev_dir,"app/config-memcache.json") do
    mode "0644"
    action :create
    content memcached_server_ips.to_json
    only_if do
      File.exists?(current_rev_dir)
    end
end
