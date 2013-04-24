require File.expand_path('../support/helpers', __FILE__)
require File.expand_path('../../apache2/support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface
  include Helpers::Apache

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'runs no tests by default' do
  end

  it "creates a service account for the myface daemon" do
    user("myface").must_exist
  end

  it "runs a MySQL service" do
    service(node[:mysql][:service_name]).must_be_running
    service(node[:mysql][:service_name]).must_be_enabled
  end

  it "seeds the myface database" do
    myface_tables.must_include('users')
  end

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
end
