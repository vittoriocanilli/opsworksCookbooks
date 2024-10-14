#
# Cookbook Name:: samplecompany-trackingfrontend
# Recipe:: rotate_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

logrotate_app 'samplecompanytrackingfrontend_logs' do
  cookbook      'logrotate'
  path          File.join(node['samplecompany-trackingfrontend']['log_dir'], '*.log')
  frequency     'daily'
  rotate        90
  create        '0644 root adm'
end