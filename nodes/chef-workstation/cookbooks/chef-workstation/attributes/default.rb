default["chef_workstation"]["owner"] = "vagrant"
default["chef_workstation"]["home"] = "/home/vagrant"
default["chef_workstation"]["fqdn"] = "workstation.bandbook.com"
default["chef_workstation"]["database"]["run_list"] = "recipe[apt],recipe[mongodb::10gen_repo],recipe[mongodb]"
