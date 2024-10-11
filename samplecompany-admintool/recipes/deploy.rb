#
# Cookbook Name:: samplecompany-admintool
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-admintool::init_attributes"

deploy_branch node['samplecompany-admintool']['app_dir'] do
  action             :deploy
  enable_submodules  false
  user               "root"
  group              "root"
  repository         node['samplecompany-admintool']['git_repository']
  ssh_wrapper        node['samplecompany-admintool']['github_ssh_wrapper']
  revision           node['samplecompany-admintool']['git_branch']
  purge_before_symlink([])
  create_dirs_before_symlink([])
  symlink_before_migrate({})
  symlinks({})
  
  before_symlink do
    command_string_start = "php #{release_path}/index.php --environment=" + node['samplecompany-admintool']['kohana_env']
    cron "admintool promotions" do
      minute "*/1"
      command command_string_start + " --uri=cron/promotions >> /tmp/promo_cron.log"
    end
    cron "admintool deals" do
      minute "5"
      command command_string_start + " --uri=cron/deal >> /tmp/deals_cron.log"
    end
    cron "admintool last chances" do
      minute "5"
      weekday "1,7"
      command command_string_start + " --uri=cron/lastChance >> /tmp/lastchance_cron.log"
    end
    cron "admintool notifications" do
      minute "*/2" # we send 1000 notifications every 2 minutes
      command command_string_start + " --uri=cron/SendNotifications >> /tmp/notifications.log"
    end
    cron "admintool notifications game to user reactivation 3 days" do
      minute "0"
      hour "0"
      day "*/3"
      command command_string_start + " --uri=cron/game_to_user_notifications/100 >> /tmp/notifications_game_to_user_3_days_reactivation.log"
    end
    cron "admintool notifications game to user reactivation 7 days" do
      minute "0"
      hour "0"
      day "*/7"
      command command_string_start + " --uri=cron/game_to_user_notifications/101 >> /tmp/notifications_game_to_user_7_days_reactivation.log"
    end
    cron "admintool notifications game to user Paying users-reactivation" do
      minute "0"
      hour "0"
      day "*/14"
      command command_string_start + " --uri=cron/game_to_user_notifications/102 >> /tmp/notifications_game_to_user_paying_users_reactivation.log"
    end
  end
end

execute "Set permissions for the app" do
  cwd         "#{node['samplecompany-admintool']['app_dir']}/current"
  command     "chmod -R 755 ."
end

# Create log and cache directories
include_recipe "samplecompany-admintool::create_dirs"

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"