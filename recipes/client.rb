package 'munin-node'

service_name = node['munin']['service_name']

service service_name do
  supports restart: true
  action :enable
end

template "#{node['munin']['basedir']}/munin-node.conf" do
  source 'munin-node.conf.erb'
  mode 0644
  notifies :restart, "service[#{service_name}]"
end
