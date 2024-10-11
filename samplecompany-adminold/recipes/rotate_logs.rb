#
# Cookbook Name:: samplecompany-adminold
# Recipe:: rotate_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

logrotate_app 'reporting-logs' do
  cookbook      'logrotate'
  path          File.join(node['samplecompany-adminold']['reporting_dir'], '*.log')
  frequency     'daily'
  rotate        90
  create        '0644 root adm'
end