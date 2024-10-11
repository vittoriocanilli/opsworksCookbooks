#
# Cookbook Name:: samplecompany-portal
# Recipe:: shutdown
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-portal::init_attributes"

# Remove keys and SSH wrapper for GIT
include_recipe "samplecompany-portal::git_remove"