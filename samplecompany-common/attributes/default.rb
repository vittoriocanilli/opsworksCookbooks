# Environment configuration
node.chef_environment                                  = nil

# Web app data
default['samplecompany-common']['app_dir']             = nil
default['samplecompany-common']['log_dir']             = '/var/log/commonlib_logs'
default['samplecompany-common']['memcached']           = []

# GIT configuration
default['samplecompany-common']['git_branch']          = nil
default['samplecompany-common']['git_repository']      = nil
default['samplecompany-common']['ssh_key']             = 'id_rsa.commonlib'
default['samplecompany-common']['ssh_key_content']     = nil
default['samplecompany-common']['github_ssh_wrapper']  = "/tmp/github_ssh_wrapper_commonlib.sh"
default['samplecompany-common']['ssh_dir_path']        = "/root/.ssh"

# Memcached configuration (used only in production)
default['samplecompany-common']['memcached']           = ["common-t2-small.some.thing.euw1.cache.amazonaws.com"]