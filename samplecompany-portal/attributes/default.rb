# Environment configuration
node.chef_environment                                         = nil

# App configuration
default['samplecompany-portal']['app_dir']                    = nil

# Webserver configuration
default['samplecompany-portal']['server_name']                = nil

# GIT configuration
default['samplecompany-portal']['git_branch']                 = nil
default['samplecompany-portal']['git_repository']             = nil
default['samplecompany-portal']['ssh_key']                    = "id_rsa.portal"
default['samplecompany-portal']['ssh_key_content']            = nil
default['samplecompany-portal']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_portal.sh"
default['samplecompany-portal']['ssh_dir_path']               = "/root/.ssh"

# Nginx FastCGI configuration
default['samplecompany-portal']['fastcgi_read_timeout']       = "300"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]          = "12:00"