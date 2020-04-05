#
# Cookbook:: factorio
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

user(node['factorio']['default']['user'].to_s) do
  action :create
end

directory(node['factorio']['default']['install_dir'].to_s) do
  owner node['factorio']['default']['user'].to_s
  group node['factorio']['default']['user'].to_s
  mode '0775'
  action :create
end
