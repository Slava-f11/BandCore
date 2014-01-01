directory "/home/vagrant/.chef" do
    owner "vagrant" 
    group "vagrant"
    mode "777" 
    action :create
end

directory "/home/vagrant/.chef/checksums" do
    owner "vagrant"
    group "vagrant"
    mode "777"
    action :create
end

directory "/home/vagrant/.ssh" do
    owner "vagrant" 
    group "vagrant"
    mode 0700 
    action :create
end

cookbook_file "/home/vagrant/.ssh/id_rsa" do
    mode 0600
    owner "vagrant" 
    group "vagrant"
    source "id_rsa"
    action :create
end

cookbook_file "/home/vagrant/.ssh/id_rsa.pub" do
    mode 0644
    owner "vagrant" 
    group "vagrant"
    source "id_rsa.pub"
    action :create
end

cookbook_file "/home/vagrant/.ssh/known_hosts" do
    mode 0644
    owner "vagrant" 
    group "vagrant"
    source "known_hosts"
    action :create
end

cookbook_file "/home/vagrant/.chef/knife.rb" do
    mode 0644
    owner "vagrant"
    group "vagrant"
    source "knife.rb"
    action :create
end

cookbook_file "/home/vagrant/.chef/vagrant.pem" do
    mode 0644
    owner "vagrant"
    group "vagrant"
    source "vagrant.pem"
    action :create
end

bash "copy_pems_from_server" do
    user "vagrant"
    cwd "/home/vagrant"
    code <<-EOH
    scp vagrant@192.168.33.10:/etc/chef-server/admin.pem .chef
    scp vagrant@192.168.33.10:/etc/chef-server/chef-validator.pem .chef
    EOH
end