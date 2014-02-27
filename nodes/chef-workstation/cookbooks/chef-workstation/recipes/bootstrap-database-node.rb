bash "bootstrap_database" do
  user node["chef_workstation"]["owner"]
  cwd node["chef_workstation"]["home"]
  code <<-EOH
    knife bootstrap 192.168.33.12 -x vagrant -P vagrant --sudo -N database -r #{node["chef_workstation"]["database"]["run_list"]}
  EOH
end