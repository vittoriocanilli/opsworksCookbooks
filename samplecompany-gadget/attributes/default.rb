# App configuration
default['samplecompany-gadget']['app_dir']                    = nil
default['samplecompany-gadget']['log_dir']                    = ""

# Webserver configuration
default['samplecompany-gadget']['deploy_master']              = "php1"

# GIT configuration
default['samplecompany-gadget']['git_branch']                 = nil
default['samplecompany-gadget']['git_repository']             = nil
default['samplecompany-gadget']['ssh_key']                    = "id_rsa.gadget"
default['samplecompany-gadget']['ssh_key_content']            = nil
default['samplecompany-gadget']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_gadget.sh"
default['samplecompany-gadget']['ssh_dir_path']               = "/root/.ssh"

# S3 settings
default['samplecompany-gadget']['s3_bucket']                  = "imgs3.samplecompany.com"
default['samplecompany-gadget']['s3_prefix']                  = "general/"