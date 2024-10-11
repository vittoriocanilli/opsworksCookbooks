# Environment configuration
node.chef_environment                                            = nil

# App configuration
default['samplecompany-kernel']['app_dir']                       = nil

# Webserver configuration
default['samplecompany-kernel']['server_name']                   = nil
default['samplecompany-kernel']['laravel_env']                   = nil

# GIT configuration
default['samplecompany-kernel']['git_branch']                    = nil
default['samplecompany-kernel']['git_repository']                = nil
default['samplecompany-kernel']['ssh_key']                       = "id_rsa.kernel"
default['samplecompany-kernel']['ssh_key_content']               = nil
default['samplecompany-kernel']['github_ssh_wrapper']            = "/tmp/github_ssh_wrapper_kernel.sh"
default['samplecompany-kernel']['ssh_dir_path']                  = "/root/.ssh"

# Cronjobs Configuration
normal['samplecompany-webserver']["cron_daily_time"]             = "12:00"