#
# Cookbook Name:: samplecompany-game
# Recipe:: update_translations
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

current_instance = search("aws_opsworks_instance", "self:true").first
current_instance_hostname = current_instance['hostname']

if node['samplecompany-game']['deploy_master'] == current_instance_hostname
  # Update translations database and clear i18n cache
  execute "Update data" do
    command "cd #{File.join(node['samplecompany-game']['app_dir'], 'current')} && php index.php --uri=deploy --env=#{node['samplecompany-game']['kohana_env']}"
  end
end