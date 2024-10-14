#
# Cookbook Name:: samplecompany-reporttools
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
include_recipe "samplecompany-reporttools::init_attributes"

# Install Java
include_recipe "java"

# Create directories for JAR archive and cronjobs
include_recipe "samplecompany-reporttools::create_dirs"

# Install packages required to install RubyGems with native extensions
#include_recipe "build-essential"

# Install Ruby Gems
#include_recipe "samplecompany-reporttools::ruby-gems"

# Install and configure GIT
include_recipe "samplecompany-reporttools::git_add"