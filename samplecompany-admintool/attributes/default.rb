# Environment configuration
node.chef_environment                                            = nil

# App configuration
default['samplecompany-admintool']['app_dir']                    = nil
default['samplecompany-admintool']['log_dir']                    = "/var/log/admin_tool"

# Webserver configuration
default['samplecompany-admintool']['listening_port']             = "80"
default['samplecompany-admintool']['server_name']                = nil
default['samplecompany-admintool']['kohana_env']                 = nil

# GIT configuration
default['samplecompany-admintool']['git_branch']                 = nil
default['samplecompany-admintool']['git_repository']             = nil
default['samplecompany-admintool']['ssh_key']                    = "id_rsa.admintool"
default['samplecompany-admintool']['ssh_key_content']            = nil
default['samplecompany-admintool']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_admintool.sh"
default['samplecompany-admintool']['ssh_dir_path']               = "/root/.ssh"

# Nginx FastCGI configuration
default['samplecompany-admintool']['fastcgi_connect_timeout']    = "600"
default['samplecompany-admintool']['fastcgi_read_timeout']       = "600"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]             = "12:00"