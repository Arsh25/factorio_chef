tcb = 'factorio'
save_name = node[tcb]['factorio_install']['save_name'].to_s
install_dir = node[tcb]['default']['install_dir'].to_s
factorio_user = node[tcb]['default']['user'].to_s

remote_file install_dir + '/factorio_package.tar.xz' do
  source node[tcb]['factorio_install']['download_url'].to_s
  owner factorio_user
  group factorio_user
  mode '0440'
  action :create
  notifies :run, 'execute[Extract Factorio package]'
end

execute 'Extract Factorio package' do
  command 'tar -xJf ' + install_dir + '/factorio_package.tar.xz'
  user factorio_user
  group factorio_user
  cwd install_dir
  action :nothing
end

execute 'Create save game' do
  cwd install_dir
  command 'factorio/bin/x64/factorio --create ' + install_dir + '/.saves/' + save_name
  user factorio_user
  group factorio_user
  not_if { ::File.exist?(install_dir + '/.saves/' + save_name) }
end

cron_d 'start factorio server' do
  command node[tcb]['default']['install_dir'].to_s +
          '/factorio/bin/x64/factorio --start-server ' + install_dir + '/.saves/' + save_name
  predefined_value '@reboot'
  # user 'root'
end
