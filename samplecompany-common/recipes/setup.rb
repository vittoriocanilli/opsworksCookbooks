#
# Cookbook Name:: samplecompany-common
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
include_recipe "samplecompany-common::init_attributes"

# Install PHP-FPM
include_recipe "php5-fpm::install"

# Install Cache
include_recipe "samplecompany-common::install_cache"

# Install and configure GIT
include_recipe "samplecompany-common::git_add"
