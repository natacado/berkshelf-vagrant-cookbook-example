#
# Cookbook Name:: myface
# Recipe:: database
#
# Copyright (C) 2013 Paul Paradise
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::server"
include_recipe "mysql::ruby"

# Create mysql connection binding
mysql_connection_info = { :host => node['myface']['database']['host'],
  :username => node['myface']['database']['username'],
  :password => node['myface']['database']['password'] }

# Metadata dependency on the database cookbook provides
# acces to the mysql_database provider
mysql_database node['myface']['database']['dbname'] do
  connection mysql_connection_info
  action :create
end

# Write schema seed file to filesystem
cookbook_file node['myface']['database']['seed_file'] do
  source 'myface-init.sql'
  owner 'root'
  group 'root'
  mode 0644
end

execute "initialize myface database" do
  command "mysql -h #{node['myface']['database']['host']} -u #{node['myface']['database']['username']} -p#{node['myface']['database']['password']} -D #{node['myface']['database']['dbname']} < #{node['myface']['database']['seed_file']}"
  not_if "mysql -h localhost -u['myface']['database']['username']} root -p#{node['myface']['database']['password']} -D #{node['myface']['database']['dbname']} -e 'describe users;'"
end
