#
# Cookbook Name:: samplecompany-game
# Recipe:: deploy
#
# Copyright 2016 -2017, SampleCompany LLC
#
# All rights reserved - Do Not Redistribute
#

# Initialize attributes from Opsworks data bags
include_recipe "samplecompany-game::init_attributes"

current_instance = search("aws_opsworks_instance", "self:true").first
current_instance_hostname = current_instance['hostname']

deploy_branch node['samplecompany-game']['app_dir'] do
  user                        "root"
  group                       "root"
  migrate                     false
  symlinks({})
  symlink_before_migrate({})
  purge_before_symlink([])
  create_dirs_before_symlink([])
  repository                  node['samplecompany-game']['git_repository']
  ssh_wrapper                 node['samplecompany-game']['github_ssh_wrapper']
  revision                    node['samplecompany-game']['git_branch']
  action                      :deploy
  
  before_symlink do
    template "#{release_path}/environment.php" do
        source 'environment.php.erb'
        mode '0666'
        owner 'www-data'
        group 'www-data'
        variables(
          :revision => scm_provider.revision_slug,
          :log_dir => node['samplecompany-game']['log_dir'],
          :cache_dir => node['samplecompany-game']['cache_dir'],
          :release_path => release_path,
          :deploy_root => new_resource.deploy_to,
          :memcache_server_ips => node['samplecompany-game']['memcached'],
          :memcache_sessions_server_ips => node['samplecompany-game']['memcached_sessions']
        )
    end
    # Update translation @ deploy master
    # Other nodes are pending until deploy master finished
    log "Deploying: Game -> Environment: #{node['samplecompany-game']['kohana_env']}"
    if node['samplecompany-game']['deploy_master'] == current_instance_hostname
      # Delete guests cronjob
      cron "Delete guests" do
        hour "3"
        minute "0"
        command "cd #{release_path} && php index.php --uri=deploy/delete_guests --env=#{node['samplecompany-game']['kohana_env']}"
      end
    end
    # Combine and minify assets
    execute "Combine and minify assets" do
      command "cd #{release_path} && php index.php --uri=deploy/combine_assets --env=#{node['samplecompany-game']['kohana_env']}"
    end
  end
  
  before_restart do
    if node['samplecompany-game']['deploy_master'] == current_instance_hostname
      execute "CloudFront invalidation assets" do
        command "cd #{release_path} && php index.php --uri=deploy/invalidate_cloudfront_assets --env=#{node['samplecompany-game']['kohana_env']}"
      end
    end
  end
end

if node['samplecompany-game']['deploy_master'] == current_instance_hostname
  include_recipe "samplecompany-game::cron_update_yahoo_users"
end

if node.chef_environment == "production" && node['samplecompany-game']['deploy_master'] == current_instance_hostname
  include_recipe "samplecompany-game::cron_production_emails"
end

# Restart PHP-FPM
include_recipe "samplecompany-webserver::php-fpm-restart"