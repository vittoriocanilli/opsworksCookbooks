#
# Cookbook Name:: samplecompany-apiold
# Recipe:: memcached_config
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

memcache_server_ips = node['samplecompany-common']['memcached']

template "#{File.join(node['samplecompany-apiold']['conf_dir'],'conf.scalarium.inc.php')}" do
  source 'conf.scalarium.inc.php.erb'
  mode '0666'
  owner 'www-data'
  group 'www-data'
  variables(
    :memcache_server_ips => memcache_server_ips
  )
  only_if do
    File.exists?(node['samplecompany-apiold']['conf_dir'])
  end
end