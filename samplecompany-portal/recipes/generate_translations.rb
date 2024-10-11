#
# Cookbook Name:: samplecompany-portal
# Recipe:: generate_translations
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

execute "Generating translations files" do
  cwd       File.join(node['samplecompany-portal']['app_dir'], 'current')
  command   "php public/index.php translate"
end

execute "Compiling translations files" do
  cwd       File.join(node['samplecompany-portal']['app_dir'], 'current')
  command   "php public/index.php compile"
end

execute "Set permissions for the folder translations" do
  cwd       File.join(node['samplecompany-portal']['app_dir'], 'current', 'data', 'DoctrineModule', 'cache')
  command   "chmod -R 777 ."
end