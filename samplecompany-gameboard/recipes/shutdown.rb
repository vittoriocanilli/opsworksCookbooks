#
# Cookbook Name:: samplecompany-gameboard
# Recipe:: shutdown
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-gameboard::init_attributes"

# Remove keys and SSH wrapper for GIT
include_recipe "samplecompany-gameboard::git_remove"