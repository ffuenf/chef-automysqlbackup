default['automysqlbackup']['version'] = '3.0_rc6'
default['automysqlbackup']['checksum'] = '7787ee6de38d9a65c50121007a58e68d1b1be45ca89497aaf5e80dbf7e06f544'
default['automysqlbackup']['download_url'] = 'https://github.com/ffuenf/automysqlbackup/archive/v3.0_rc6.tar.gz'
default['automysqlbackup']['config_path'] = '/etc/automysqlbackup'
default['automysqlbackup']['config'] = 'myserver'
default['automysqlbackup']['bin_path'] = '/usr/bin'
default['automysqlbackup']['cron']['time_hour'] = '0'
default['automysqlbackup']['cron']['time_minute'] = '1'
default['automysqlbackup']['dump']['user'] = 'root'
default['automysqlbackup']['dump']['group'] = 'root'
default['automysqlbackup']['secure_backups'] = true

default['automysqlbackup']['mysql_dump_username'] = 'root'
default['automysqlbackup']['mysql_dump_password'] = ''
default['automysqlbackup']['mysql_dump_host'] = 'localhost'
default['automysqlbackup']['mysql_dump_host_friendly'] = ''
default['automysqlbackup']['backup_dir'] = '/var/backup/db'
default['automysqlbackup']['multicore'] = 'yes'
default['automysqlbackup']['multicore_threads'] = 2
default['automysqlbackup']['db_names'] = []
default['automysqlbackup']['db_month_names'] = []
default['automysqlbackup']['db_exclude'] = %w[information_schema performance_schema]
default['automysqlbackup']['table_exclude'] = []
default['automysqlbackup']['do_monthly'] = '01'
default['automysqlbackup']['do_weekly'] = '05'
default['automysqlbackup']['rotation_daily'] = 6
default['automysqlbackup']['rotation_weekly'] = 35
default['automysqlbackup']['rotation_monthly'] = 150
default['automysqlbackup']['mysql_dump_port'] = 3_306
default['automysqlbackup']['mysql_dump_commcomp'] = 'no'
default['automysqlbackup']['mysql_dump_usessl'] = 'yes'
default['automysqlbackup']['mysql_dump_socket'] = ''
default['automysqlbackup']['mysql_dump_max_allowed_packet'] = ''
default['automysqlbackup']['mysql_dump_single_transaction'] = 'no'
default['automysqlbackup']['mysql_dump_master_data'] = ''
default['automysqlbackup']['mysql_dump_full_schema'] = 'yes'
default['automysqlbackup']['mysql_dump_dbstatus'] = 'yes'
default['automysqlbackup']['mysql_dump_create_database'] = 'no'
default['automysqlbackup']['mysql_dump_use_separate_dirs'] = 'yes'
default['automysqlbackup']['mysql_dump_compression'] = 'gzip'
default['automysqlbackup']['mysql_dump_latest'] = 'no'
default['automysqlbackup']['mysql_dump_latest_clean_filenames'] = 'no'
default['automysqlbackup']['mysql_dump_differential'] = 'no'
default['automysqlbackup']['mailcontent'] = 'stdout'
default['automysqlbackup']['mail_maxattsize'] = 4_000
default['automysqlbackup']['mail_splitandtar'] = 'yes'
default['automysqlbackup']['mail_use_uuencoded_attachments'] = 'no'
default['automysqlbackup']['mail_address'] = 'root'
default['automysqlbackup']['encrypt'] = 'no'
default['automysqlbackup']['encrypt_password'] = 'password0123'
default['automysqlbackup']['backup_local_files'] = []
default['automysqlbackup']['prebackup'] = ''
default['automysqlbackup']['postbackup'] = ''
default['automysqlbackup']['dryrun'] = 0
