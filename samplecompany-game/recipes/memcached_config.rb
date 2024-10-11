#
# Cookbook Name:: samplecompany-game
# Recipe:: memcached_config
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

directory File.join(node['samplecompany-game']['app_dir'], "shared", "config") do
  action :create
  recursive true
  mode '0666'
  owner node['nginx']['user']
  group node['nginx']['user']
end

template "#{node['samplecompany-game']['app_dir']}/shared/config/scalarium.php" do
    source 'scalarium.php.erb'
    mode '0666'
    owner node['nginx']['user']
    group node['nginx']['user']
    variables(
      :memcache_server_ips => node['samplecompany-game']['memcached'],
      :memcache_sessions_server_ips => node['samplecompany-game']['memcached_sessions']
    )
    only_if do
        File.exists?("#{node['samplecompany-game']['app_dir']}/shared/config")
    end
end