#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingbackend::init_attributes"

# Run daily cronjobs when time-based instances are up as well
include_recipe "samplecompany-webserver::config_cron"

# Cronjobs to run EMR clusters
include_recipe "samplecompany-trackingbackend::cron"