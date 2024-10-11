#
# Cookbook Name:: samplecompany-gameboard
# Recipe:: dirs_permissions
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

app_dir = node['samplecompany-gameboard']['app_dir']
execute "Ensure permission to storage folder" do
  command "chmod -R 00777 #{File.join(app_dir, 'current', 'storage')}"
end
