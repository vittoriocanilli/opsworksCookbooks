#
# Cookbook Name:: samplecompany-webserver
# Recipe:: config_cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

cron_daily_time = node['samplecompany-webserver']["cron_daily_time"].split(":")

template File.join("etc", "crontab") do
  source  "crontab.erb"
  owner   "root"
  group   "root"
  mode    00644
  variables(
    :daily_hour => cron_daily_time[0],
    :daily_minute => cron_daily_time[1]
   )
end
