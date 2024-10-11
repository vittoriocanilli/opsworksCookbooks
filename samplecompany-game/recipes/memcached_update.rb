#
# Cookbook Name:: samplecompany-game
# Recipe:: memcached_update
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

# Update memcached in scalarium.php
include_recipe "samplecompany-game::memcached_config"

# Update memcached in environment.php
release_path = File.readlink("#{File.join(node['samplecompany-game']['app_dir'], 'current')}")
template "#{release_path}/environment.php" do
    source 'environment.php.erb'
    mode '0666'
    owner 'www-data'
    group 'www-data'
    variables(
      :revision => release_path[23, release_path.length - 23],
      :log_dir => node['samplecompany-game']['log_dir'],
      :cache_dir => node['samplecompany-game']['cache_dir'],
      :release_path => release_path,
      :deploy_root => node['samplecompany-game']['app_dir'],
      :memcache_server_ips => node['samplecompany-game']['memcached'],
      :memcache_sessions_server_ips => node['samplecompany-game']['memcached_sessions']
    )
end

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"