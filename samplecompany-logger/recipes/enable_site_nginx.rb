#
# Cookbook Name:: samplecompany-logger
# Recipe:: enable_site_nginx
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-logger::init_attributes"

# Stop apache2 to avoid conflicts with nginx
service "apache2" do
  action  :stop
end

# Stop nginx
service "nginx" do
  action  :stop
end

# Create the site config file and place it in sites-available
file_location = File.join(node['nginx']['dir'], "sites-available", "samplecompany_logger")
template file_location do
  source  "nginx_site.erb"
  owner   node['nginx']['user']
  group   node['nginx']['user']
  mode    00755
  variables(
    :server_name => node['samplecompany-logger']['server_name'],
    :ssl_cert_name => node['samplecompany-logger']['lb_name']
  )
end

# Enable the site
nginx_site "samplecompany_logger" do
  enable  true
end

# Start nginx
service "nginx" do
  action  :start
end
