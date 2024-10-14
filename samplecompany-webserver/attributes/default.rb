# Nginx FastCGI Configuration
default['samplecompany-webserver']['fastcgi_connect_timeout']        = "60"
default['samplecompany-webserver']['fastcgi_read_timeout']           = "60"

# Host Upgrade Configuration
normal["hostupgrade"]["upgrade_system"]                              = false

# Session Configuration
default['samplecompany-webserver']['fpm_session_save_handler']       = "session.save_handler = files"
default['samplecompany-webserver']['fpm_session_save_path']          = ";     session.save_path = \"N;/path\""
default['samplecompany-webserver']['cli_session_save_handler']       = "session.save_handler = files"
default['samplecompany-webserver']['cli_session_save_path']          = ";     session.save_path = \"N;/path\""

# Cronjobs Configuration
default['samplecompany-webserver']["cron_daily_time"]                = "6:25"

# PHP Errors Configuration
default['samplecompany-webserver']['php_error_reporting']            = "E_ALL & ~E_DEPRECATED & ~E_STRICT"