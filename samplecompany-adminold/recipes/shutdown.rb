#
# Cookbook Name:: samplecompany-adminold
# Recipe:: shutdown
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-adminold::init_attributes"

# Remove keys and SSH wrapper for GIT
include_recipe "samplecompany-adminold::git_remove"