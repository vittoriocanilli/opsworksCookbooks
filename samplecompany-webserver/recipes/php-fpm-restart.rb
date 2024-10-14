#
# Cookbook Name:: samplecompany-webserver
# Recipe:: php-fpm-restart
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute

service "#{node["php_fpm"]["package"]}" do
  action :restart
end
