#
# Cookbook Name:: samplecompany-game
# Recipe:: cron_update_yahoo_users
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

crt_dir = "#{node['samplecompany-game']['app_dir']}/current"

# Crons for updating Yahoo users
# -----------------------------------------

cron "Update game users which migrated from Yahoo" do
  minute "0"
  command "cd #{crt_dir} && php index.php --uri=deploy/update_yahoo_users/5 --env=#{node['samplecompany-game']['kohana_env']}"
end