#
# Cookbook:: nginx_uber
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nginx_uber::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect {chef_run}.to_not raise_error
    end
    it 'should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end
    it 'should enable nginx' do
      expect(chef_run).to enable_service 'nginx'
    end
    it 'should run nginx' do
      expect(chef_run).to start_service 'nginx'
    end
    it 'should a create a proxy.conf template' do
      expect(chef_run).to create_template('/etc/nginx/sites-available/proxy.conf').with_variables(proxy_port: 3000)
    end
    it 'should a create symlink' do
      expect(chef_run).to create_link('/etc/nginx/sites-enabled/proxy.conf').with_link_type(:symbolic)
    end
    it 'should delete the symlink' do
      expect(chef_run).to delete_link('/etc/nginx/sites-enabled/default')
    end
  end
end
