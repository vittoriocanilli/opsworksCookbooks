#
# Cookbook Name:: samplecompany-apiold
# Recipe:: php-packages
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

package "Install PHP5-MySQL Native Driver" do
  package_name "php5-mysqlnd"
end

package "Install PHP5 Command-Line Interpreter" do
  package_name "php5-cli"
end

package "Install PHP5-Curl" do
  package_name "php5-curl"
end