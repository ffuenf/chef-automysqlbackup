#
# Author::  Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
# Cookbook Name:: automysqlbackup
# Recipe:: default
#
# Copyright 2017, Achim Rosenhagen
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory node['automysqlbackup']['bin_path'] do
  action :create
end

directory node['automysqlbackup']['config_path'] do
  action :create
end

directory node['automysqlbackup']['backup_dir'] do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
  action :create
end

src_filename = "automysqlbackup-#{node['automysqlbackup']['version']}.tar.gz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/automysqlbackup/#{node['automysqlbackup']['checksum']}"

remote_file src_filepath do
  source node['automysqlbackup']['download_url']
  checksum node['automysqlbackup']['checksum']
end

bash 'extract automysqlbackup' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
  mkdir -p #{extract_path}
  tar xzf #{src_filename} -C #{extract_path}
  mv #{extract_path}/automysqlbackup-#{node['automysqlbackup']['version']}/automysqlbackup.conf #{node['automysqlbackup']['config_path']}/automysqlbackup.conf
  mv #{extract_path}/automysqlbackup-#{node['automysqlbackup']['version']}/automysqlbackup #{node['automysqlbackup']['bin_path']}
  EOH
  not_if { ::File.exist?(extract_path) }
  creates "#{node['automysqlbackup']['bin_path']}/automysqlbackup"
end

template "#{node['automysqlbackup']['config_path']}/#{node['automysqlbackup']['config']}.conf" do
  source 'myserver.conf.erb'
  mode 0600
  variables(
    automysqlbackup: node['automysqlbackup']
  )
end

template "#{node['automysqlbackup']['bin_path']}/run_mysql_backup" do
  source 'run_mysql_backup.erb'
  mode 0755
end

cron 'run_mysql_backup' do
  user 'root'
  hour node['automysqlbackup']['cron']['time_hour']
  minute node['automysqlbackup']['cron']['time_minute']
  command "#{node['automysqlbackup']['bin_path']}/run_mysql_backup >/dev/null 2>&1 | logger -t automysqlbackup"
end

package 'pigz' if node['automysqlbackup']['multicore'] == 'yes'
