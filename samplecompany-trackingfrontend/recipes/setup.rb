#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: setup
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Set the timezone to Berlin's time
execute "Set the timezone to Berlin's time" do
  command "timedatectl set-timezone Europe/Berlin"
end

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingfrontend::init_attributes"

# Install packages required to compile and install native addons from npm (Node.js package manager)
include_recipe "build-essential"

# Install Nginx
include_recipe "nginx"

# Install Node.js
include_recipe "nodejs"

# Install Node.js Forever package
execute "Install Forever" do
  command "npm install forever -g"
end

# Install Node.js CoffeeScript package
execute "Install coffee-script" do
  command "npm install coffee-script -g"
end

# Create log directory
include_recipe "samplecompany-trackingfrontend::create_dirs"

# Install and configure GIT
include_recipe "samplecompany-trackingfrontend::git_add"