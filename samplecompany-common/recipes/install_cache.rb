#
# Cookbook Name:: samplecompany-common
# Recipe:: install_cache
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment == "production"
  if !node['samplecompany-common']['memcached'].nil?
    package "Install PHP5-Memcache" do
      package_name "php5-memcache"
    end
  else
    package "Install PHP5 APU User Cache" do
      package_name "php5-apcu"
    end
  end
end