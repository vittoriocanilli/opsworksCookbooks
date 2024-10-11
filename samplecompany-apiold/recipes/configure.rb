#
# Cookbook Name:: samplecompany-apiold
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-apiold::init_attributes"

# Create SSL files for Nginx
include_recipe "samplecompany-apiold::create_ssl_files"

# Enable the site on Nginx
include_recipe "samplecompany-apiold::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Create log directory
include_recipe "samplecompany-apiold::create_dirs"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Cronjobs not depending on the deploy folder
include_recipe "samplecompany-apiold::cron"

# Rotate the logs of the cronjobs
include_recipe "samplecompany-apiold::rotate_logs"