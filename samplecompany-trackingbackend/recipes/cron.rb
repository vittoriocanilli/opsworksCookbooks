#
# Cookbook Name:: samplecompany-trackingbackend
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Daily 24h statistics of previous day
cron "EMR cluster every night for daily 24h statistics" do
  hour "00"
  minute "30"
  command "cd #{node['samplecompany-trackingbackend']['app_dir']}/current && /usr/bin/ruby run.rb cron > log/last_run_24h.log"
  action :create
end

# 24h statistics of a specific day
cron "EMR test/emergency cluster to recover the data of some night cluster, which didn't work" do
  month "6"
  day "19"
  hour "11"
  minute "25"
  command "cd #{node['samplecompany-trackingbackend']['app_dir']}/current && /usr/bin/ruby run.rb start 2017 06 18 22 > log/last_run_24h_2017_06_18.log"
  action :delete
end