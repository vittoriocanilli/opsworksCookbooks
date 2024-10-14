#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: rotate_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

logrotate_app 'reporttools-logs' do
  cookbook      'logrotate'
  path          File.join(node['samplecompany-reporttools']['cron_dir'], '*.log')
  frequency     'daily'
  rotate        7
  create        '0644 root adm'
end