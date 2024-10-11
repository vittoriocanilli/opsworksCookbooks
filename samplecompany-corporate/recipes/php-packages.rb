#
# Cookbook Name:: samplecompany-corporate
# Recipe:: php-packages
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

package "Install PHP5" do
  package_name "php5"
end

package "Install Apache2 module for PHP5" do
  package_name "libapache2-mod-php5"
end

package "Install PHP5-Mcrypt" do
  package_name "php5-mcrypt"
end

package "Install PHP5-MySQL" do
  package_name "php5-mysql"
end

