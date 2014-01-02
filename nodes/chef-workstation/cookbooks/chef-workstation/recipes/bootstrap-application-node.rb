bash "bootstrap_application" do
  user node["chef_workstation"]["owner"]
  cwd node["chef_workstation"]["home"]
  code <<-EOH
    knife bootstrap 192.168.33.13 -x vagrant -P vagrant --sudo -N application
  EOH
end