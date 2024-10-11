# Web app data
default['samplecompany-logger']['app_dir']                    = nil
default['samplecompany-logger']['log_dir']                    = "/var/log/samplecompany_logger_logs"
default['samplecompany-logger']['redis']                      = "logger.some.thing.euw1.cache.amazonaws.com"

# GIT configuration
default['samplecompany-logger']['git_branch']                 = nil
default['samplecompany-logger']['git_repository']             = nil
default['samplecompany-logger']['ssh_key']                    = 'id_rsa.logger'
default['samplecompany-logger']['ssh_key_content']            = nil
default['samplecompany-logger']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_logger.sh"
default['samplecompany-logger']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]          = "14:00"