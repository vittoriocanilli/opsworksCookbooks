#
# Cookbook Name:: samplecompany-portal
# Recipe:: dirs_permissions
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

execute "Set permissions for the app" do
  cwd         File.join(node['samplecompany-portal']['app_dir'], 'current')
  command     "chmod -R 755 ."
end

execute "Set permissions for the assets" do
  cwd         File.join(node['samplecompany-portal']['app_dir'], 'current', 'public')
  command     "chmod -R 777 ."
end