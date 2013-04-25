require File.expand_path('../support/helpers', __FILE__)
require File.expand_path('../../apache2/support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface
  include Helpers::Apache

  it "Enables and starts the httpd daemon" do
    # HACK: This should be an attribute, but we'll just violently rip it out of the run_context
    # We could just hardcode this to "httpd" but that's CentOS-specific.
    apache2_service_name = run_context.resource_collection.lookup("service[apache2]").service_name
    service(apache2_service_name).must_be_running
    service(apache2_service_name).must_be_enabled
  end

  it "enables mode_php5" do
    apache_enabled_modules.must_include "php5_module"
  end

  it "installs php-mysql" do
    package("php-mysql").must_be_installed
  end

  it "configures apache for myface" do
    link("#{node['apache']['dir']}/sites-enabled/myface.conf").must_exist.with(:link_type, :symbolic).and(:to, "#{node['apache']['dir']}/sites-available/myface.conf")
  end

  it "deploys the myface index page" do
    directory("/srv/apache/myface").must_have(:mode, "755").with(:owner, "root").and(:group, "root")
    file("/srv/apache/myface/index.php").must_have(:mode, "644").with(:owner, "root").and(:group, "root")
  end
end
