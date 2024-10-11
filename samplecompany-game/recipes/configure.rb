#
# Cookbook Name:: samplecompany-game
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

# Create SSL files for Nginx
include_recipe "samplecompany-game::create_ssl_files"

# Enable the site on Nginx
include_recipe "samplecompany-game::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Create cache and logs directories
include_recipe "samplecompany-game::create_dirs"

# Update memcached with latest endpoints (mostly useful for time-based and load-based instances)
include_recipe "samplecompany-game::memcached_update"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"