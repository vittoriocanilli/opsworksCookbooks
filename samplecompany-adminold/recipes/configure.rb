#
# Cookbook Name:: samplecompany-adminold
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-adminold::init_attributes"

# Create auth basic user file for Nginx
include_recipe "samplecompany-adminold::create_nginx_auth_file"

# Enable the site on Nginx
include_recipe "samplecompany-adminold::enable_site_nginx"

# Customize php.ini files
include_recipe "samplecompany-webserver::php-ini"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"

# Cronjobs not depending on the deploy folder
include_recipe "samplecompany-adminold::cron"

# Rotate the logs of the reporting
include_recipe "samplecompany-adminold::rotate_logs"