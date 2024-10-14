#
# Cookbook Name:: samplecompany-webserver
# Recipe:: delete_nginx_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Stop nginx
service "nginx" do
  action  :stop
end

# Delete all NGINX logs
execute "Delete all NGINX logs" do
  command "rm -rf *"
  cwd "/var/log/nginx/"
end

# Start nginx
service "nginx" do
  action  :start
end