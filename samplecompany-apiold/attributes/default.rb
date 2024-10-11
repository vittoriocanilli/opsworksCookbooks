# App configuration
default['samplecompany-apiold']['app_dir']                    = nil
default['samplecompany-apiold']['app_sub_dir']                = nil
default['samplecompany-apiold']['log_dir']                    = "/var/log/www-data"
default['samplecompany-apiold']['log_dir_target']             = "/mnt/log/www-data"
default['samplecompany-apiold']['api_dir']                    = "/var/www/api"
default['samplecompany-apiold']['conf_dir']                   = "/var/conf"

# Webserver configuration
default['samplecompany-apiold']['server_name']                = nil
default['samplecompany-apiold']['deploy_master']              = "php1"

# GIT configuration
default['samplecompany-apiold']['git_branch']                 = nil
default['samplecompany-apiold']['git_repository']             = nil
default['samplecompany-apiold']['ssh_key']                    = "id_rsa.apiold"
default['samplecompany-apiold']['ssh_key_content']            = nil
default['samplecompany-apiold']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_apiold.sh"
default['samplecompany-apiold']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]          = "16:00"