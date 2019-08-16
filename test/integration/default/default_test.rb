# InSpec test for recipe nginx_uber::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/


# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end

describe service 'nginx' do
  it{should be_enabled}
  it{should be_running}
end

describe package 'nginx' do
  it{should be_installed}
end
