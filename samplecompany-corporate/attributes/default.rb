# Web app data
default['samplecompany-corporate']['app_dir']                      = nil

# GIT configuration
default['samplecompany-corporate']['git_branch']                   = nil
default['samplecompany-corporate']['git_repository']               = nil
default['samplecompany-corporate']['ssh_key']                      = 'id_rsa.corporate'
default['samplecompany-corporate']['ssh_key_content']              = nil
default['samplecompany-corporate']['github_ssh_wrapper']           = "/tmp/github_ssh_wrapper_corporate.sh"
default['samplecompany-corporate']['ssh_dir_path']                 = "/root/.ssh"