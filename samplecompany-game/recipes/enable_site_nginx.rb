#
# Cookbook Name:: samplecompany-game
# Recipe:: enable_site_nginx
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

# Stop apache2 to avoid conflicts with nginx
service "apache2" do
  action  :stop
end

# Stop nginx
service "nginx" do
  action  :stop
end

# Create the site config file and place it in sites-available
file_location = File.join(node['nginx']['dir'], "sites-available", "samplecompany_game")
template file_location do
  source  "nginx_site.erb"
  owner   node['nginx']['user']
  group   node['nginx']['user']
  mode    00755
  variables(
    :app_dir => node['samplecompany-game']['app_dir'],
    :server_name => node['samplecompany-game']['server_name']
   )
end

# Enable the site
nginx_site "samplecompany_game" do
  enable  true
end

# Start nginx
service "nginx" do
  action  :start
end
