directory "/home/vagrant/.chef" do
    owner "vagrant" 
    group "vagrant"
    mode "777" 
    action :create
end

package "sshpass"

execute "get admin pem" do
	command "sshpass -p vagrant scp vagrant@192.168.33.10:/etc/chef-server/admin.pem ~/.chef"
end

execute "get validation pem" do
	command "sshpass -p vagrant scp vagrant@192.168.33.10:/etc/chef-server/chef-validator.pem ~/.chef"
end
