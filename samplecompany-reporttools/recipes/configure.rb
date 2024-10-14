#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: configure
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-reporttools::init_attributes"

# Cronjobs to calculate KPIs and send reports
include_recipe "samplecompany-reporttools::cron"

# Rotate the logs of the report tools
include_recipe "samplecompany-reporttools::rotate_logs"