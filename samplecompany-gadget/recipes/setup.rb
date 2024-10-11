#
# Cookbook Name:: samplecompany-gadget
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
include_recipe "samplecompany-gadget::init_attributes"

# Install packages required to install RubyGems with native extensions
include_recipe "build-essential"

# Install Nginx
include_recipe "nginx"

# Install MySQL library for client
mysql_client 'default' do
  action :create
end

# Install PHP-FPM
include_recipe "php5-fpm::install"

# Install Ruby
package "Install Ruby" do
  package_name "ruby"
end

# Install Ruby Gems
include_recipe "samplecompany-gadget::ruby-gems"

# Configure Nginx FastCGI for PHP-FPM
include_recipe "samplecompany-webserver::nginx-fastcgi"

# Install and configure GIT
include_recipe "samplecompany-gadget::git_add"
