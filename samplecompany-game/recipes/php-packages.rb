#
# Cookbook Name:: samplecompany-game
# Recipe:: php-packages
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

package "Install PHP5-Mcrypt" do
  package_name "php5-mcrypt"
end

package "Install PHP5-MySQL" do
  package_name "php5-mysql"
end

package "Install PHP5 Command-Line Interpreter" do
  package_name "php5-cli"
end

package "Install PHP5-Curl" do
  package_name "php5-curl"
end

package "Install PHP HTTP Request 2" do
  package_name "php-http-request2"
end

package "Install PHP5 Memcache" do
  package_name "php5-memcache"
end