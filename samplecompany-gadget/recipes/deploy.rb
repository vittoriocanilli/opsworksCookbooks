#
# Cookbook Name:: samplecompany-gadget
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-gadget::init_attributes"

current_instance = search("aws_opsworks_instance", "self:true").first
current_instance_hostname = current_instance['hostname']

application = "gadget"
application += "_dev" if node.chef_environment == "staging"

deploy_branch node['samplecompany-gadget']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-gadget']['git_repository']
  ssh_wrapper                 node['samplecompany-gadget']['github_ssh_wrapper']
  revision                    node['samplecompany-gadget']['git_branch']
  action                      :deploy
  
  before_migrate do
    current_release_directory = release_path
    running_deploy_user = new_resource.user
    bundler_depot = new_resource.shared_path + '/bundle'
    excluded_groups = %w(development test)
    
    script 'Bundling the gems' do
      interpreter 'bash'
      cwd current_release_directory
      user running_deploy_user
      code <<-EOS
        bundle install --path #{bundler_depot} \
          --without #{excluded_groups.join(' ')}
      EOS
    end
  end # END before_migrate
  
  before_symlink do
    # This is executed before the app is linked
    # We perform two steps in this script
    # 1. The master server or the first web server will upload all assets to Amazon S3
    # 2. All other servers are waiting for the upload to finish
    revision = scm_provider.revision_slug # GIT Revision
    
    log "Updating gadget: #{application} - #{revision}"

    is_master = (node['samplecompany-gadget']['deploy_master'] == current_instance_hostname)
    
    # Should I upload the assets?
    if is_master
      # Execute deployment outside of Chef's sandbox
      # Catch errors and display them in colors
      Chef::Log.info "Master server deploys the assets on S3 server"
      execute "Deploy Assets" do
        command "cd #{release_path} && `which ruby` deploy/deploy.rb deploy #{application} --rev=#{revision}" 
        returns [0, 99]
      end
    
      ruby_block "Check for exception" do
        block do
          log_file = "#{release_path}/deploy_exception.txt"
          if ::File.exists?(log_file)
            error = ::IO.read log_file
            ::File.unlink log_file
            raise Chef::Exceptions::Exec, "Can't deploy the gadget.\n #{error}"
          end
        end
      end
    end
    
    # Process the environment file
    template "#{release_path}/app/layout/environment.php" do
      source 'environment.php.erb'
      mode '0666'
      owner 'www-data'
      group 'www-data'
      variables(
        :revision => scm_provider.revision_slug,
        :release_path => release_path,
        :deploy_root => new_resource.deploy_to,
        :cdn => "s3.amazonaws.com/#{node['samplecompany-gadget'][:s3_bucket]}/#{node['samplecompany-gadget'][:s3_prefix]}#{application}/"
      )
    end
  end # END before_symlink
  
  before_restart do
    # This is executed after the app is linked
    # Link into api folder
    link "/var/www/api/#{application}" do
      to "#{release_path}/app/layout"
    end
  end # END before_restart
end

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"