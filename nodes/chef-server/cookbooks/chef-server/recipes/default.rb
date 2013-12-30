#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/tmp/chef-server.deb" do
  source "chef-server.deb"
  action :create_if_missing
end

package "chef-server" do
	provider Chef::Provider::Package::Dpkg
	action :install
	source "/tmp/chef-server.deb"
end

execute "configure-server" do
	command "sudo chef-server-ctl reconfigure"
end

file "/etc/chef-server/admin.pem" do
	owner "vagrant"
	mode 777
end

file "/etc/chef-server/chef-validator.pem" do
	owner "vagrant"
	mode 777
end
