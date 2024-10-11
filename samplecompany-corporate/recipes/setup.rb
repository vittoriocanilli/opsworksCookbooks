#
# Cookbook Name:: samplecompany-corporate
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
include_recipe "samplecompany-corporate::init_attributes"

# Install Apache2 with SSL module
include_recipe "apache2::mod_ssl"

# Install MySQL library for client
mysql_client 'default' do
  action :create
end

# Install extra PHP packages
include_recipe "samplecompany-corporate::php-packages"

# Install and configure GIT
include_recipe "samplecompany-corporate::git_add"