directory "#{node["chef_workstation"]["home"]}/.chef" do
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    mode "777" 
    action :create
end

directory "#{node["chef_workstation"]["home"]}/.chef/checksums" do
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    mode "777"
    action :create
end

directory "#{node["chef_workstation"]["home"]}/.ssh" do
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    mode 0700 
    action :create
end

cookbook_file "#{node["chef_workstation"]["home"]}/.ssh/id_rsa" do
    mode 0600
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    source "id_rsa"
    action :create
end

cookbook_file "#{node["chef_workstation"]["home"]}/.ssh/id_rsa.pub" do
    mode 0644
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    source "id_rsa.pub"
    action :create
end

cookbook_file "#{node["chef_workstation"]["home"]}/.ssh/known_hosts" do
    mode 0644
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    source "known_hosts"
    action :create
end

cookbook_file "#{node["chef_workstation"]["home"]}/.chef/knife.rb" do
    mode 0644
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    source "knife.rb"
    action :create
end

cookbook_file "#{node["chef_workstation"]["home"]}/.chef/vagrant.pem" do
    mode 0644
    owner node["chef_workstation"]["owner"]
    group node["chef_workstation"]["owner"]
    source "vagrant.pem"
    action :create
end

bash "copy_pems_from_server" do
    user node["chef_workstation"]["owner"]
    cwd node["chef_workstation"]["home"]
    code <<-EOH
    scp vagrant@192.168.33.10:/etc/chef-server/admin.pem .chef
    scp vagrant@192.168.33.10:/etc/chef-server/chef-validator.pem .chef
    EOH
end