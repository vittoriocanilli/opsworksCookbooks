#
# Cookbook Name:: samplecompany-admintool
# Recipe:: rotate_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

logrotate_app 'admintool-cron' do
  cookbook      'logrotate'
  path          '/tmp/*.log'
  frequency     'daily'
  rotate        90
  create        '0644 root adm'
end