#
# Cookbook Name:: samplecompany-common
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment == "staging"
  # Delete log files, which are older than 60 days
  cron "commonlib delete old log files" do
    minute "0"
    hour "14"
    command "find #{node['samplecompany-common']['log_dir']}/* -mtime +60 -exec rm {} \\;"
  end
end