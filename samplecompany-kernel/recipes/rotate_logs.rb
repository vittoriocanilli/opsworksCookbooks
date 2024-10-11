#
# Cookbook Name:: samplecompany-kernel
# Recipe:: rotate_logs
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

logrotate_app 'nginx' do
  cookbook      'logrotate'
  path          '/var/log/nginx/*.log'
  frequency     'daily'
  rotate        90
  options       ['missingok', 'compress', 'delaycompress', 'notifempty', 'sharedscripts']
  create        '0640 www-data adm'
  prerotate <<-EOFprerotatenginx
    if [ -d /etc/logrotate.d/httpd-prerotate ]; then \\
      run-parts /etc/logrotate.d/httpd-prerotate; \\
    fi \\
  EOFprerotatenginx
  postrotate <<-EOFpostrotatenginx
    [ -s /run/nginx.pid ] && kill -USR1 `cat /run/nginx.pid`
  EOFpostrotatenginx
end