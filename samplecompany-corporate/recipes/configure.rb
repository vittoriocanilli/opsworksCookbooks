#
# Cookbook Name:: samplecompany-corporate
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-corporate::init_attributes"

# Create SSL files for Apache
include_recipe "samplecompany-corporate::create_ssl_files"

# Enable the site on Apache
include_recipe "samplecompany-corporate::enable_site_apache"

# Customize php.ini file
include_recipe "samplecompany-corporate::php-ini"
