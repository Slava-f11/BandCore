directory "/home/vagrant/.chef" do
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

#execute "get admin pem" do
#	command "sshpass -p vagrant scp vagrant@192.168.33.10:/etc/chef-server/admin.pem ~/.chef"
#end

#execute "get validation pem" do
#	command "sshpass -p vagrant scp vagrant@192.168.33.10:/etc/chef-server/chef-validator.pem ~/.chef"
#end
