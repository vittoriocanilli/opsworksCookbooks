#
# Cookbook Name:: samplecompany-portal
# Recipe:: default
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Setting up the server
include_recipe "samplecompany-portal::setup"

# Deploy the application from GIT
include_recipe "samplecompany-portal::deploy"

# Configuration for the deployed application
include_recipe "samplecompany-portal::configure"