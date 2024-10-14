# App configuration
default['samplecompany-trackingfrontend']['app_dir']                    = nil
default['samplecompany-trackingfrontend']['log_dir']                    = "/var/log/tracking_frontend"

# GIT configuration
default['samplecompany-trackingfrontend']['git_branch']                 = nil
default['samplecompany-trackingfrontend']['git_repository']             = nil
default['samplecompany-trackingfrontend']['ssh_key']                    = "id_rsa.trackingfrontend"
default['samplecompany-trackingfrontend']['ssh_key_content']            = nil
default['samplecompany-trackingfrontend']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_trackingfrontend.sh"
default['samplecompany-trackingfrontend']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
#normal['samplecompany-webserver']["cron_daily_time"]                    = "23:00"