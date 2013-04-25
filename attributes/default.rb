default['myface']['database']['host'] = 'localhost'
default['myface']['database']['username'] = 'root'
default['myface']['database']['password'] = node['mysql']['server_root_password']
default['myface']['database']['dbname'] = 'myface'
default['myface']['database']['seed_file'] = '/tmp/myface-init.sql'
