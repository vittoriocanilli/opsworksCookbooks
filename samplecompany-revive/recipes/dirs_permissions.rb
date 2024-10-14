#
# Cookbook Name:: samplecompany-revive
# Recipe:: dirs_permissions
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

app_dir = node['samplecompany-revive']['app_dir']
writable_dirs = [
  File.join(app_dir, 'current', 'var'),
  File.join(app_dir, 'current', 'var', 'cache'),
  File.join(app_dir, 'current', 'var', 'plugins'),
  File.join(app_dir, 'current', 'var', 'templates_compiled'),
  File.join(app_dir, 'current', 'plugins'),
  File.join(app_dir, 'current', 'www', 'admin', 'plugins'),
  File.join(app_dir, 'current', 'www', 'images'),
]

writable_dirs.each do |dir|
  execute "Ensure permission: #{dir}" do
    command "chmod -R a+w #{dir}"
  end
end