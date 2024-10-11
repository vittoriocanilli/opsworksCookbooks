#
# Cookbook Name:: samplecompany-admintool
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-admintool::init_attributes"

# Enable the site on Nginx
include_recipe "samplecompany-admintool::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Cronjobs not depending on the deploy folder
include_recipe "samplecompany-admintool::cron"

# Rotate the logs of the cronjobs
include_recipe "samplecompany-admintool::rotate_logs"