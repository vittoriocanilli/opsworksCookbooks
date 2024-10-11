#
# Cookbook Name:: samplecompany-logger
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-logger::init_attributes"

# Create SSL files for Nginx
include_recipe "samplecompany-logger::create_ssl_files"

# Enable the site on Nginx
include_recipe "samplecompany-logger::enable_site_nginx"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Rotate the logs of the cronjobs
include_recipe "samplecompany-logger::rotate_logs"