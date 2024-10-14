#
# Cookbook Name:: samplecompany-revive
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-revive::init_attributes"

# Create SSL files for Nginx
include_recipe "samplecompany-revive::create_ssl_files"

# Enable the site on Nginx
include_recipe "samplecompany-revive::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Create configuration files
include_recipe "samplecompany-revive::create_conf_files"

# Set correct permissions to application's directories
include_recipe "samplecompany-revive::dirs_permissions"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Cronjobs not depending on the deploy folder
include_recipe "samplecompany-revive::cron"

# Create cache directory
include_recipe "samplecompany-revive::create_dirs"
