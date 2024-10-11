#
# Cookbook Name:: samplecompany-portal
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-portal::init_attributes"

# Create SSL files for Nginx
if node.chef_environment == "production"
  include_recipe "samplecompany-portal::create_ssl_files"
end

# Enable the site on Nginx
include_recipe "samplecompany-portal::enable_site_nginx"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"
