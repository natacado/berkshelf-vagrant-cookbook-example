#
# Cookbook Name:: myface
# Recipe:: webserver
#
# Copyright (C) 2013 Paul Paradise
# 
# All rights reserved - Do Not Redistribute
#

node.default['apache']['default_site_enabled'] = false
include_recipe "apache2"
include_recipe "apache2::mod_php5"

package "php-mysql" do
  action :install
  notifies :restart, "service[apache2]"
end

template "#{node['apache']['dir']}/sites-available/myface.conf" do
  source "apache2.conf.erb"
  notifies :restart, 'service[apache2]'
end

apache_site "myface.conf" do
  enable true
  notifies :restart, 'service[apache2]'
end

directory "/srv/apache/myface" do
  action :create
  mode 0755
  recursive true
end

template "/srv/apache/myface/index.php" do
  source "index.php.erb"
  mode 0644
end
