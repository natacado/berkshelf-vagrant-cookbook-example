require File.expand_path('../support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface

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

end
