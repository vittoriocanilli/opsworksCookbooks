#
# Cookbook Name:: samplecompany-adminold
# Recipe:: create_nginx_auth_file
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/nginx/admin_htpasswd' do
  source 'admin_htpasswd'
  mode '0644'
  owner 'root'
  group 'root'
end