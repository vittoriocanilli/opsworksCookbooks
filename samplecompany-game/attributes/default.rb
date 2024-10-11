# Environment configuration
node.chef_environment                                       = nil

# App configuration
default['samplecompany-game']['app_dir']                    = nil
default['samplecompany-game']['cache_dir']                  = "/tmp/game_cache"
default['samplecompany-game']['log_dir']                    = "/var/log/game"

# Webserver configuration
default['samplecompany-game']['server_name']                = nil
default['samplecompany-game']['kohana_env']                 = nil
default['samplecompany-game']['deploy_master']              = "php1"

# GIT configuration
default['samplecompany-game']['git_branch']                 = nil
default['samplecompany-game']['git_repository']             = nil
default['samplecompany-game']['ssh_key']                    = "id_rsa.game"
default['samplecompany-game']['ssh_key_content']            = nil
default['samplecompany-game']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_game.sh"
default['samplecompany-game']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]        = "16:00"