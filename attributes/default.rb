default['munin']['basedir'] = '/etc/munin'
default['munin']['plugin_dir'] = '/usr/share/munin/plugins'
default['munin']['service_name'] = 'munin-node'
default['munin']['plugins'] = "#{default['munin']['basedir']}/plugins"
default['munin']['tmpldir'] = "#{default['munin']['basedir']}/templates"

default['munin']['host'] = '*'
default['munin']['port'] = 4_949
default['munin']['global_timeout'] = 900
default['munin']['timeout'] = 60
default['munin']['user'] = 'root'
default['munin']['group'] = 'root'
default['munin']['log_level'] = 4
default['munin']['log_file'] = '/var/log/munin/munin-node.log'
default['munin']['pid_file'] = '/var/run/munin/munin-node.pid'
default['munin']['ignore_files'] = %w(
  [\#~]$
  DEADJOE$
  \.bak$
  %$
  \.dpkg-(tmp|new|old|dist)$
  \.rpm(save|new)$
  \.pod$
)
