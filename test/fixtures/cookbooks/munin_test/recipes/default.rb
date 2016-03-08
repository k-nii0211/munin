#
# Cookbook Name:: munin_test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'munin::client'

package 'libwww-perl'

%w(
  request
  status
).each do |suggest|
  munin_plugin "nginx_#{suggest}" do
    enable true
  end
end

package 'git'

phpfpm_plugin_dirs = "#{node['munin']['plugin_dir']}/php5-fpm-munin-plugins"

git phpfpm_plugin_dirs do
  repository 'git://github.com/tjstein/php5-fpm-munin-plugins.git'
  reference 'master'
  action :sync
end

Dir["#{phpfpm_plugin_dirs}/phpfpm_*"].each do |file_path|
  file file_path do
    mode '0755'
    action :create
  end
end

%w(
  average
  connections
  memory
  processes
  status
).each do |suggest|
  munin_plugin "phpfpm_#{suggest}" do
    plugin_dir phpfpm_plugin_dirs
    enable true
  end
end
