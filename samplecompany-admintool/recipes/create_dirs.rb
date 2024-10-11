#
# Cookbook Name:: samplecompany-admintool
# Recipe:: create_dirs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-admintool::init_attributes"

own = node['nginx']['user']
gro = node['nginx']['user']
app_dir = node['samplecompany-admintool']['app_dir']

# Create other directories for Kohana: logs and cache
%w{logs cache}.each do |dir|
  directory File.join(app_dir, 'current', 'application', dir) do
    action    :delete
    recursive true
  end
  directory File.join(app_dir, 'current', 'application', dir) do
    action    :create
    recursive true
    owner     own
    group     gro
    mode      00777
  end
end

# Create a symlink for the upload directory
if !File.exist?('/var/admintool_uploads')
  directory '/var/admintool_uploads' do
    action    :create
    recursive true
    mode      00755
    owner     own
    group     gro
  end
end
directory File.join(app_dir, 'current', 'uploads') do
    action    :delete
    recursive true
end
link File.join(app_dir, 'current', 'uploads') do
    to    '/var/admintool_uploads'
end


# Create log directory
directory node['samplecompany-admintool']['log_dir'] do
  action      :create
  recursive   true
  mode        00755
  owner       own
  group       gro
end

# Create payment reports directory
directory "/var/exportreport" do
  action      :create
  recursive   true
  mode        00777
  owner       own
  group       gro
end

file "/var/exportreport/output.csv" do
  owner       own
  group       gro
  mode        00777
  action      :create
end
