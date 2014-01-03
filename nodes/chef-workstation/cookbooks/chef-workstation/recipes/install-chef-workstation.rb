cookbook_file "/tmp/chef-client.deb" do
  source "chef-client.deb"
  action :create_if_missing
end

execute "sudo hostname #{node["chef_workstation"]["fqdn"]}"
execute "echo #{node["chef_workstation"]["fqdn"]} | sudo tee /etc/hostname"

package "chef-client" do
	provider Chef::Provider::Package::Dpkg
	action :install
	source "/tmp/chef-client.deb"
end
