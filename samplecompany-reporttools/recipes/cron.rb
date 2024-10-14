#
# Cookbook Name:: samplecompany-reporttools
# Recipe:: cron
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Restart the cron deamon to synch with the changed timezone
service "cron" do
  action :restart
end

cronjobs = [
  ["generate_mobile_reports", "schedulers.MobileReportingJob", "40 8 * * *"],
  ["generate_new_regs_report", "schedulers.NewRegistrationsReport", "30 9 * * *"],
  ["marketing_report", "schedulers.MarketingSchedulerJob", "10 9 * * *"],
  ["net_financial_report", "schedulers.NetFinancialReportSchedulerJob", "30 13 * * *"],
  ["generate_exchangerate", "schedulers.ExchangeRateSchedulerJob", "0 12 * * *"],
  ["financial_exchange_rate_job", "schedulers.FinancialExchangeRateJob", "15 12 * * *"],
  ["report_per_country", "schedulers.ReportPerCountry ", "30 13 1 * *"],
  ["email_db_cleaner", "schedulers.EmailDbCleanerJob", "*/5 * * * *"],
  ["update_last_login", "schedulers.UserMigrationLastLoginUpdateJob", "30 0 * * *"],
  ["generate_core_users", "kpis.WaruKPI `date +%j`", "0 10 * * *"],
  ["user_migration_job", "schedulers.UserMigrationJob", "*/3 * * * *"],
  ["tracking_update_job", "schedulers.TrackingTableMigrationJob", "20 0 * * *"],
  ["partner_update_job", "schedulers.PartnerTableMigrationJob", "15 0 * * *"],
  ["generate_cohorts_sales", "schedulers.CohortsSchedulerJob 1", "30 7 * * *"],
  ["generate_report90days", "schedulers.ReportSchedulerJob", "0 9 * * *"],
  ["generate_kpi", "schedulers.KPISchedulerJob 1", "59 3 * * *"]
]

cronjobs.each do |cronjob|
  
  cronjob_name = cronjob[0]
  cronjob_class = cronjob[1]
  cronjob_time = cronjob[2].split(" ")
  cronjob_minute = cronjob_time[0]
  cronjob_hour = cronjob_time[1]
  cronjob_day = cronjob_time[2]
  cronjob_month = cronjob_time[3]
  cronjob_weekday = cronjob_time[4]
  
  template "#{node['samplecompany-reporttools']['cron_dir']}/#{cronjob_name}.sh" do
    mode "0755"
    user "root"
    group "root"
    source "cronjob_sh.erb"
    variables(
      :class_to_execute => "#{cronjob_class}",
      :app_dir => node['samplecompany-reporttools']['app_dir'],
      :jar_dir => node['samplecompany-reporttools']['jar_dir']
    )
  end
  
  cron "ReportTools: execute #{cronjob_name}" do
    minute "#{cronjob_minute}"
    hour "#{cronjob_hour}"
    day "#{cronjob_day}"
    month "#{cronjob_month}"
    weekday "#{cronjob_weekday}"
    command "cd #{node['samplecompany-reporttools']['cron_dir']} && #{node['samplecompany-reporttools']['cron_dir']}/#{cronjob_name}.sh > #{cronjob_name}.log 2>&1"
  end
  
end