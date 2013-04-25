require File.expand_path('../support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface

  it "runs a MySQL service" do
    service(node[:mysql][:service_name]).must_be_running
    service(node[:mysql][:service_name]).must_be_enabled
  end

  it "seeds the myface database" do
    myface_tables.must_include('users')
  end
end
