#
# Cookbook Name:: samplecompany-kernel
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-kernel::init_attributes"

# Enable the site on Nginx
include_recipe "samplecompany-kernel::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Rotate the logs
include_recipe "samplecompany-kernel::rotate_logs"