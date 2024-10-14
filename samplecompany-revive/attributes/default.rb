# App configuration
default['samplecompany-revive']['app_dir']                    = nil
default['samplecompany-revive']['log_dir']                    = ""
default['samplecompany-revive']['cache_mode']                 = "file_cache" # Either file_cache or memcached
default['samplecompany-revive']['cache_dir']                  = "/tmp/rv_cache/"
default['samplecompany-revive']['memcached']                  = ["revive-r3-large.some.thing.euw1.cache.amazonaws.com:11211"]

# Webserver configuration
default['samplecompany-revive']['server_name']                = nil

# GIT configuration
default['samplecompany-revive']['git_branch']                 = nil
default['samplecompany-revive']['git_repository']             = nil
default['samplecompany-revive']['ssh_key']                    = "id_rsa.revive"
default['samplecompany-revive']['ssh_key_content']            = nil
default['samplecompany-revive']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_revive.sh"
default['samplecompany-revive']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]          = "18:00"