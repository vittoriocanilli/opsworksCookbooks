#
# Cookbook Name:: samplecompany-corporate
# Recipe:: create_ssl_files
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-corporate::init_attributes"

service "apache2" do
  supports    :status => true, :restart => true, :reload => true
  action      :stop
end

directory File.join(node['apache']['dir'], "ssl") do
  action      :create
  recursive   true
  mode        "0755"
end

file "SSL Certificate" do
  content     node['samplecompany-corporate']['ssl_crt']
  path        File.join(node['apache']['dir'], "ssl", "#{node['samplecompany-corporate']['server_name']}.crt")
  mode        "0600"
  owner       "root"
  group       "root"
end

file "SSL Certificates of Certification Authorities (CA)" do
  content     node['samplecompany-corporate']['ssl_ca']
  path        File.join(node['apache']['dir'], "ssl", "#{node['samplecompany-corporate']['server_name']}.ca")
  mode        "0600"
  owner       "root"
  group       "root"
end

file "SSL Certificate key" do
  content     node['samplecompany-corporate']['ssl_key']
  path        File.join(node['apache']['dir'], "ssl", "#{node['samplecompany-corporate']['server_name']}.key")
  mode        "0600"
  owner       "root"
  group       "root"
end

service "apache2" do
  action      :start
end