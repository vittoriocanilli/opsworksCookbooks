#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingfrontend::init_attributes"

# Create SSL files for Nginx
include_recipe "samplecompany-trackingfrontend::create_ssl_files"

# Enable the site on Nginx
include_recipe "samplecompany-trackingfrontend::enable_site_nginx"

# Rotate the logs
include_recipe "samplecompany-trackingfrontend::rotate_logs"