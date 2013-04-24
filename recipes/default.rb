#
# Cookbook Name:: myface
# Recipe:: default
#
# Copyright (C) 2013 Paul Paradise
# 
# All rights reserved - Do Not Redistribute
#

user "myface"

include_recipe "mysql::server"
