#
# Cookbook Name:: samplecompany-corporate
# Recipe:: php-ini
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute

#Create php.ini for Apache2
template "/etc/php5/apache2/php.ini" do
  source    "php.ini.apache2.erb"
  owner     "root"
  group     "root"
  mode      00644
  action    :create
end

# Restart apache2
service "apache2" do
  action  :restart
end