#
# Cookbook Name:: samplecompany-common
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-common::init_attributes"

# Create log directory
include_recipe "samplecompany-common::create_dirs"

# Create json configuration in app directory
include_recipe "samplecompany-common::create_json"

# Cronjobs not depending on the deploy folder
include_recipe "samplecompany-common::cron"