# myface cookbook

# Requirements
- Chef 11.04 or higher
- CentOS 6.3

# Usage
Example cookbook written to show Application Cookbook patterns

# Attributes
default['myface']['database']['host'] = 'localhost'
default['myface']['database']['username'] = 'root'
default['myface']['database']['password'] = node['mysql']['server_root_password']
default['myface']['database']['dbname'] = 'myface'

default['myface']['database']['seed_file'] = '/tmp/myface-init.sql


# Recipes
default.rb
 - Install the full myface stack on a single node

database.rb
 - Install MySQL
 - Creates MySQL schema, seeds schema with test data

webserver.rb
 - Installs Apache and mod_php
 - Install the php-mysql library
 - Disables Apache default website
 - Configure Apache for Myface
 - Deploys Myface

# Author

Author:: Paul Paradise (<paul.paradise@socrata.com>)
