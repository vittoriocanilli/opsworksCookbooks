#
# Cookbook Name:: samplecompany-gadget
# Recipe:: update_translations
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-gadget::init_attributes"

current_instance = search("aws_opsworks_instance", "self:true").first
current_instance_hostname = current_instance['hostname']

if node['samplecompany-gadget']['deploy_master'] == current_instance_hostname
  # Update translations files
  execute "Update translations" do
    command "`which php` -f create_files.php"
    cwd File.join(node['samplecompany-gadget']['app_dir'], 'current', 'deploy', 'deploy_translations')
  end
end