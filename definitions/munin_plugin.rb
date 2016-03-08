define :munin_plugin, create_file: false, enable: true, cookbook: 'munin' do
  include_recipe 'munin::client'

  plugin = params[:plugin] ? params[:plugin] : params[:name]
  plugin_config = params[:plugin_config] ? params[:plugin_config] : node['munin']['plugins']
  plugin_dir = params[:plugin_dir] ? params[:plugin_dir] : node['munin']['plugin_dir']
  service_name = params[:service_name] ? params[:service_name] : node['munin']['service_name']

  cookbook_file "#{plugin_dir}/#{params[:name]}" do
    cookbook params[:cookbook]
    source   "plugins/#{params[:name]}"
    owner    node['munin']['user']
    group    node['munin']['group']
    mode     '0755'
    only_if { params[:create_file] }
  end

  link "#{plugin_config}/#{plugin}" do
    to "#{plugin_dir}/#{params[:name]}"
    if params[:enable]
      action :create
    else
      action :delete
    end
    notifies :restart, "service[#{service_name}]"
  end
end
