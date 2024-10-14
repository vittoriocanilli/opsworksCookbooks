#
# Cookbook Name:: samplecompany-revive
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Create the script to check if the load balancer is up
template "/root/check.sh" do
  source  "check_sh.erb"
  owner   "root"
  group   "root"
  mode    00755
  variables(
    :lb_name => node['samplecompany-revive']['lb_name']
   )
end

# Run the script to check if the load balancer is up 
#cron "revive check if the load balancer is up" do
#  command "sh /root/check.sh"
#end
# Cronjob disabled as long as we don't have the check.php in the Revive repository