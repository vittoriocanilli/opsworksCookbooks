# App configuration
default['samplecompany-adminold']['app_dir']                    = nil
#default['samplecompany-adminold']['log_dir']                    = "/var/log/admin_tool"
default['samplecompany-adminold']['adminold_dir']               = "/var/www/admin"
default['samplecompany-adminold']['reporting_dir']              = "/root/bin/reporting"

# Webserver configuration
default['samplecompany-adminold']['server_name']                = nil
default['samplecompany-adminold']['server_main_name']           = nil

# GIT configuration
default['samplecompany-adminold']['git_branch']                 = nil
default['samplecompany-adminold']['git_repository']             = nil
default['samplecompany-adminold']['ssh_key']                    = "id_rsa.adminold"
default['samplecompany-adminold']['ssh_key_content']            = nil
default['samplecompany-adminold']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_adminold.sh"
default['samplecompany-adminold']['ssh_dir_path']               = "/root/.ssh"