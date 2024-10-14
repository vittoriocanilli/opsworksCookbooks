#
# Cookbook Name:: samplecompany-webserver
# Recipe:: php-ini
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute

#Create php.ini for PHP5-FPM
template "/etc/php5/fpm/php.ini" do
  source    "php.ini.fpm.erb"
  owner     "root"
  group     "root"
  mode      00644
  action    :create
  variables(
    :fpm_session_save_handler => node['samplecompany-webserver']['fpm_session_save_handler'],
    :fpm_session_save_path => node['samplecompany-webserver']['fpm_session_save_path'],
    :php_error_reporting => node['samplecompany-webserver']['php_error_reporting']
   )
end

#Create php.ini for PHP5-CLI
template "/etc/php5/cli/php.ini" do
  source    "php.ini.cli.erb"
  owner     "root"
  group     "root"
  mode      00644
  action    :create
  variables(
    :cli_session_save_handler => node['samplecompany-webserver']['cli_session_save_handler'],
    :cli_session_save_path => node['samplecompany-webserver']['cli_session_save_path'],
    :php_error_reporting => node['samplecompany-webserver']['php_error_reporting']
   )
end