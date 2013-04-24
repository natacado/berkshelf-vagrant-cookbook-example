# myface cookbook

# Requirements
- Chef 11.04 or higher
- CentOS 6.3

# Usage
Example cookbook written to show Application Cookbook patterns

# Attributes
None (yet)

# Recipes
default.rb
 - Creates myface user
 - Install MySQL
 - Creates MySQL schema, seeds schema with test data
 - Installs Apache and mod_php
 - Install the php-mysql library
 - Disables Apache default website
 - Configure Apache for Myface
 - Deploys Myface

# Author

Author:: Paul Paradise (<paul.paradise@socrata.com>)
