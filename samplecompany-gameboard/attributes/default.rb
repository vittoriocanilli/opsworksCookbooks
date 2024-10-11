# Environment configuration
node.chef_environment                                            = nil

# App configuration
default['samplecompany-gameboard']['app_dir']                    = nil

# Webserver configuration
default['samplecompany-gameboard']['server_name']                = nil
default['samplecompany-gameboard']['laravel_env']                = nil

# GIT configuration
default['samplecompany-gameboard']['git_branch']                 = nil
default['samplecompany-gameboard']['git_repository']             = nil
default['samplecompany-gameboard']['ssh_key']                    = "id_rsa.gameboard"
default['samplecompany-gameboard']['ssh_key_content']            = nil
default['samplecompany-gameboard']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_gameboard.sh"
default['samplecompany-gameboard']['ssh_dir_path']               = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]             = "12:00"