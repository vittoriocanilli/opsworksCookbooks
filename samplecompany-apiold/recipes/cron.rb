#
# Cookbook Name:: samplecompany-apiold
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

current_instance = search("aws_opsworks_instance", "self:true").first
current_instance_hostname = current_instance['hostname']

if (node['samplecompany-apiold']['deploy_master'] == current_instance_hostname)
	# Check the queue for refunding to execute (done in AdminOld)
	cron "cronjob for refunding" do
		minute "*/10"
		command "`which php` #{File.join(node['samplecompany-apiold']['api_dir'], 'refundingCron.php')}"
		action :delete
	end
	# The following script updates the table smart_ad_server in the database "advertising".
	# It is needed for syncing the Smart Ad Server backend with ours. (dismissed service)
	cron "cronjob for Smart Ad Server" do
		minute "7"
		hour "3"
		command "`which php` #{File.join(node['samplecompany-apiold']['api_dir'], 'smartAdServer', 'cronjob.php')}"
		action :delete
	end
end

# Delete log files, which are older than 30 days
cron "apiOld delete old log files" do
	minute "30"
	hour "17"
	command "find #{node['samplecompany-apiold']['log_dir']}/* -mtime +30 -exec rm {} \\;"
end