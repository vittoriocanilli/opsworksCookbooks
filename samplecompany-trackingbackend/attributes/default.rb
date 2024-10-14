# App configuration
default['samplecompany-trackingbackend']['app_dir']                    = nil

# GIT configuration
default['samplecompany-trackingbackend']['git_branch']                 = nil
default['samplecompany-trackingbackend']['git_repository']             = nil
default['samplecompany-trackingbackend']['ssh_key']                    = "id_rsa.trackingbackend"
default['samplecompany-trackingbackend']['ssh_key_content']            = nil
default['samplecompany-trackingbackend']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_trackingbackend.sh"
default['samplecompany-trackingbackend']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]                   = "23:00"