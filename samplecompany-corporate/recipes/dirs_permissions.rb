#
# Cookbook Name:: samplecompany-corporate
# Recipe:: dirs_permissions
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

app_dir = File.join(node['samplecompany-corporate']['app_dir'], "current", "*")
apache_user = node['apache']['user']
apache_group = node['apache']['group']

execute "Ensure permissions in app directory" do
  command "chown -R #{apache_user}:#{apache_group} #{app_dir}"
end
