#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: shutdown
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingbackend::init_attributes"

# Remove keys and SSH wrapper for GIT
include_recipe "samplecompany-trackingbackend::git_remove"