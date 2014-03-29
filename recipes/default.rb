#
# Cookbook Name:: couchpotato
# Recipe:: default
#

include_recipe "bluepill"
include_recipe "git"

# Set up sabnzbd user
user node['couchpotato']['user'] do
  system true
end

# Create directories
app_dirs = [
  "home/#{node['couchpotato']['user']}",
  "#{node["couchpotato"]["directories"]["install"]}",
  "#{node["couchpotato"]["directories"]["logs"]}",
  "#{node["couchpotato"]["directories"]["config"]}",
  "#{node["couchpotato"]["directories"]["data"]}"
]

app_dirs.each do |x|
  directory x do
    mode 0755
    owner node['couchpotato']['user']
    group node['couchpotato']['group']
    recursive true
  end
end

# Checkout sickbeard
git node["couchpotato"]["directories"]["install"] do
  repository node['couchpotato']['git']['url']
  revision node['couchpotato']['git']['tag']
  action :sync
  user node['couchpotato']['user']
  group node['couchpotato']['group']
end

# Set up daemon with bluepill
template "#{node['bluepill']['conf_dir']}/couchpotato.pill" do
  source "couchpotato.pill.erb"
  mode 0644
end

bluepill_service "couchpotato" do
  action [:enable, :load, :start]
end
