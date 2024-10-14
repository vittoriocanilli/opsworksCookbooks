# App configuration
default['samplecompany-reporttools']['app_dir']                    = nil
default['samplecompany-reporttools']['jar_dir']                    = "/usr/local/reporttool/lib"
default['samplecompany-reporttools']['cron_dir']                   = "/usr/local/reporttool/bin"

# GIT configuration
default['samplecompany-reporttools']['git_branch']                 = nil
default['samplecompany-reporttools']['git_repository']             = nil
default['samplecompany-reporttools']['ssh_key']                    = "id_rsa.reporttools"
default['samplecompany-reporttools']['ssh_key_content']            = nil
default['samplecompany-reporttools']['github_ssh_wrapper']         = "/tmp/github_ssh_wrapper_reporttools.sh"
default['samplecompany-reporttools']['ssh_dir_path']               = "/root/.ssh"

# Java Configuration
normal['java']['jdk_version']                                      = '6'