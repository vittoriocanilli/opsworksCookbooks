#
# Cookbook Name:: samplecompany-portal
# Recipe:: php-packages
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Install PHP
include_recipe "php"

# Install PHP5-MySQL
include_recipe "php::module_mysql"

#Install PHP5-Curl
include_recipe "php::module_curl"

#Install PHP5-GD
include_recipe "php::module_gd"

package "Install PHP5-Mcrypt" do
  package_name "php5-mcrypt"
end

execute 'Enable PHP5-Mcrypt module' do
  command 'php5enmod mcrypt'
end