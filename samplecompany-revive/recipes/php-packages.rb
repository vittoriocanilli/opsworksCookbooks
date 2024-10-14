#
# Cookbook Name:: samplecompany-revive
# Recipe:: php-packages
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

package "Install PHP5 Command-Line Interpreter" do
  package_name "php5-cli"
end

package "Install PHP5-MySQL" do
  package_name "php5-mysql"
end

package "Install PHP5-Curl" do
  package_name "php5-curl"
end

package "Install PHP5 GD" do
  package_name "php5-gd"
end

package "Install PHP5 APU User Cache" do
  package_name "php5-apcu"
end