#
# Cookbook Name:: samplecompany-trackingbackend
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
include_recipe "samplecompany-trackingbackend::init_attributes"

# Install packages required to install RubyGems with native extensions
include_recipe "build-essential"

# Install Ruby
package "Install Ruby" do
  package_name "ruby"
end

# Install Ruby Gems
include_recipe "samplecompany-trackingbackend::ruby-gems"

# Install and configure GIT
include_recipe "samplecompany-trackingbackend::git_add"