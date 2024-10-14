#
# Cookbook Name:: samplecompany-revive
# Recipe:: create_conf_files
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

cache_plugin = if node['samplecompany-revive']['cache_mode'] == "memcached" then "deliveryCacheStore:oxMemcached:oxMemcached" else "deliveryCacheStore:oxCacheFile:oxCacheFile" end

server_name = node['samplecompany-revive']['server_name'][1]
template File.join(node['samplecompany-revive']['app_dir'], "current", "var", "#{server_name}.conf.php") do
  source  "conf_file.erb"
  owner   "root"
  group   "root"
  mode    00666
  variables(
    :app_current_dir => File.join(node['samplecompany-revive']['app_dir'], "current"),
    :server_name => server_name,
    :mysql_socket => "/var/run/mysqld/mysqld.sock",
    :cache_plugin => cache_plugin,
    :cache_dir => node['samplecompany-revive']['cache_dir'],
    :memcached_clusters => node['samplecompany-revive']['memcached']
   )
end
