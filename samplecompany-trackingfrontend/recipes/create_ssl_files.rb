#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: create_ssl_files
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-trackingfrontend::init_attributes"

service "nginx" do
  supports    :status => true, :restart => true, :reload => true
  action      :stop
end

directory File.join(node['nginx']['dir'], "ssl") do
  action      :create
  recursive   true
  mode        "0755"
end

file "SSL Certificate" do
  content     node['samplecompany-trackingfrontend']['ssl_crt']
  path        File.join(node['nginx']['dir'], "ssl", "#{node['samplecompany-trackingfrontend']['lb_name']}.crt")
  mode        "0600"
  owner       "root"
  group       "root"
end

file "SSL Certificates of Certification Authorities (CA)" do
  content     node['samplecompany-trackingfrontend']['ssl_ca']
  path        File.join(node['nginx']['dir'], "ssl", "#{node['samplecompany-trackingfrontend']['lb_name']}.ca")
  mode        "0600"
  owner       "root"
  group       "root"
end

file "SSL Certificate key" do
  content     node['samplecompany-trackingfrontend']['ssl_key']
  path        File.join(node['nginx']['dir'], "ssl", "#{node['samplecompany-trackingfrontend']['lb_name']}.key")
  mode        "0600"
  owner       "root"
  group       "root"
end

service "nginx" do
  action      :start
end