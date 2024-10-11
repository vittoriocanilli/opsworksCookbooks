#
# Cookbook Name:: samplecompany-corporate
# Recipe:: enable_site_apache
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-corporate::init_attributes"

# Stop apache2
service "apache2" do
  action  :stop
end

# Create the site config file and enable it
web_app "#{node['samplecompany-corporate']['server_name']}" do
  template "apache_site.erb"
  docroot "#{File.join(node['samplecompany-corporate']['app_dir'],"current")}"
  server_name node['samplecompany-corporate']['server_name']
  server_aliases node['samplecompany-corporate']['server_aliases']
  enable true
end

# Prepare apache2 modules
apache_module "mpm_event" do
  enable false
end
apache_module "mpm_prefork" do
  enable true
end

# Start apache2
service "apache2" do
  action  :start
end
