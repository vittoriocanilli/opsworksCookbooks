#
# Cookbook Name:: samplecompany-logger
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-logger::init_attributes"

execute "Stop Node.js server" do
  command "forever stop server.js"
  cwd File.join(node['samplecompany-logger']['app_dir'], 'current')
  only_if "pgrep sampleCompanyLogger"
end

deploy_branch node['samplecompany-logger']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-logger']['git_repository']
  ssh_wrapper                 node['samplecompany-logger']['github_ssh_wrapper']
  revision                    node['samplecompany-logger']['git_branch']
  action                      :deploy
	# Deploy hooks are in the project's repository
end

# Create symbolic link to log folder
link File.join(node['samplecompany-logger']['app_dir'], 'current', 'log') do
  to node['samplecompany-logger']['log_dir']
end

forever_logs = "-a -l #{File.join(node['samplecompany-logger']['log_dir'], "forever.log")}"
forever_logs << " -o #{File.join(node['samplecompany-logger']['log_dir'], "out.log")}"
forever_logs << " -e #{File.join(node['samplecompany-logger']['log_dir'], "error.log")}"
execute "Start Node.js server" do
  command "forever start #{forever_logs} server.js"
  cwd File.join(node['samplecompany-logger']['app_dir'], 'current')
end