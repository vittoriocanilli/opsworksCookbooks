#
# Cookbook Name:: samplecompany-admintool
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Delete log files, which are older than 60 days
cron "admintool delete old log files" do
  minute "30"
  hour "14"
  command "find #{node['samplecompany-admintool']['log_dir']}/* -mtime +60 -exec rm {} \\;"
end