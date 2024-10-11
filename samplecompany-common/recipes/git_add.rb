#
# Cookbook Name:: samplecompany-common
# Recipe:: git_add
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Install GIT
package "Install GIT" do
  package_name "git"
end

# Upload private SSH key for GIT
file "#{node['samplecompany-common']['ssh_dir_path']}/#{node['samplecompany-common']['ssh_key']}" do
  content "#{node['samplecompany-common']['ssh_key_content']}"
  mode '0600'
  owner 'root'
  group 'root'
end

# Retrieve public key from SSH private key
execute "Retrieve public key from SSH private key" do
  cwd node['samplecompany-common']['ssh_dir_path']
  command "ssh-keygen -y -f #{node['samplecompany-common']['ssh_key']} > #{node['samplecompany-common']['ssh_key']}.pub"
end

# Create the ssh wrapper to be used with GIT
template node['samplecompany-common']['github_ssh_wrapper'] do
  source "ssh-wrapper.erb"
  backup false
  mode "0700"
  owner 'root'
  group 'root'
  variables(
    :private_key => "#{node['samplecompany-common']['ssh_dir_path']}/#{node['samplecompany-common']['ssh_key']}"
   )
end

# Set SSH directory permissions
execute "Set SSH directory permissions" do
  cwd node['samplecompany-common']['ssh_dir_path']
  command "chmod 0700 .; chmod 0600 id_rsa*; chmod 0644 *.pub;"
end

