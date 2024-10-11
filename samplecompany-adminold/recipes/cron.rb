#
# Cookbook Name:: samplecompany-adminold
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Health check
cron "health check" do
	minute "*/5"
	command "`which php` #{File.join(node['samplecompany-adminold']['adminold_dir'], 'support', 'cron', 'healthCheck.php')} 15"
	action :create
end

# Reporting SampleCompanyGadget
cron "reporting SampleCompanyGadget" do
	minute "1"
	hour "2"
	command "`which php` #{File.join(node['samplecompany-adminold']['reporting_dir'], 'stats.php')} >> #{File.join(node['samplecompany-adminold']['reporting_dir'], 'log_stats.log')}"
	action :create
end

# Reporting SampleCompanyGame
cron "reporting SampleCompanyGame" do
	minute "2"
	hour "2"
	command "`which php` #{File.join(node['samplecompany-adminold']['reporting_dir'], 'stats.php')} game >> #{File.join(node['samplecompany-adminold']['reporting_dir'], 'log_game.log')}"
	action :create
end

# Check the queue for refunding to execute
cron "cronjob for refunding" do
	minute "*/2"
	command "`which php` #{File.join(node['samplecompany-adminold']['adminold_dir'], 'rebookCron.php')} >> /var/log/refundingCron.log"
	action :create
end

# Check tracking
cron "check tracking" do
	minute "0"
	hour "8"
	command "`which php` #{File.join(node['samplecompany-adminold']['reporting_dir'], 'check_tracking.php')}"
	action :create
end