#
# Cookbook Name:: samplecompany-webserver
# Recipe:: nginx-fastcgi
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action :stop
end

template "#{node[:nginx][:dir]}/fastcgi_params" do
  source "fastcgi_params.erb"
  backup false
  mode "0755"
  owner 'root'
  group 'root'
end

# disable default nginx site
nginx_site 'default' do
  enable false
end

service "nginx" do
  action :start
end
