#
# Cookbook Name:: samplecompany-game
# Recipe:: cron_production_emails
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

crt_dir = "#{node['samplecompany-game']['app_dir']}/current"

# Crons for mass reward emails
# -----------------------------------------

cron "Get users for game mass reward emails day 1" do
  minute "0"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/1 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 2" do
  minute "6"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/2 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 3" do
  minute "12"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/3 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 4" do
  minute "18"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/4 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 5" do
  minute "24"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/5 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 6" do
  minute "30"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/6 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 7" do
  minute "36"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/7 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 8" do
  minute "42"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/8 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 9" do
  minute "48"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/9 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reward emails day 10" do
  minute "54"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/10 --type=incentive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 1" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=1 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 2" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=2 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 3" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=3 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 4" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=4 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 5" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=5 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 6" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=6 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 7" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=7 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 8" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=8 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 9" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=9 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 10" do
  minute "*/15"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_incentive_rewarded_emails --day=10 --env=#{node['samplecompany-game']['kohana_env']}"
end

# -----------------------------------------
# Crons for mass reward reactivation emails
# -----------------------------------------

cron "Get users for game mass reactivation reward emails day 1" do
  minute "1"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/1 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reactivation reward emails day 2" do
  minute "7"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/2 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reactivation reward emails day 3" do
  minute "13"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/3 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reactivation reward emails day 4" do
  minute "19"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/4 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reactivation reward emails day 5" do
  minute "25"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/5 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Get users for game mass reactivation reward emails day 6" do
  minute "31"
  command "cd #{crt_dir} && php index.php --uri=email/get_users_for_mass_email/6 --type=inactive --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails 1 (7 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=1 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 2 (14 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=2 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 3 (21 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=3 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 4 (28 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=4 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 5 (90 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=5 --env=#{node['samplecompany-game']['kohana_env']}"
end
cron "Send emails for game mass reward emails day 6 (180 days)" do
  minute "*/17"
  command "cd #{crt_dir} && php index.php --uri=email/send_mass_reactivation_rewarded_emails --day=6 --env=#{node['samplecompany-game']['kohana_env']}"
end