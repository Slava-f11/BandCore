bash "bootstrap_database" do
  user node["chef_workstation"]["owner"]
  cwd node["chef_workstation"]["home"]
  code <<-EOH
      mkdir cookbooks
      knife cookbook site download mongodb -f mongodb.tar.gz
      tar xzvf mongodb.tar.gz -C cookbooks/
      rm mongodb.tar.gz

      knife cookbook site download apt -f apt.tar.gz
      tar xzvf apt.tar.gz -C cookbooks/
      rm apt.tar.gz

      knife cookbook site download python -f python.tar.gz
      tar xzvf python.tar.gz -C cookbooks/
      rm python.tar.gz

      knife cookbook site download runit -f runit.tar.gz
      tar xzvf runit.tar.gz -C cookbooks/
      rm runit.tar.gz

      knife cookbook site download yum -f yum.tar.gz
      tar xzvf yum.tar.gz -C cookbooks/
      rm yum.tar.gz

      knife cookbook site download yum-epel -f yum-epel.tar.gz
      tar xzvf yum-epel.tar.gz -C cookbooks/
      rm yum-epel.tar.gz

      knife cookbook site download build-essential -f build-essential.tar.gz
      tar xzvf build-essential.tar.gz -C cookbooks/
      rm build-essential.tar.gz

      knife cookbook upload build-essential
      knife cookbook upload yum
      knife cookbook upload yum-epel
      knife cookbook upload runit
      knife cookbook upload python
      knife cookbook upload apt
      knife cookbook upload mongodb
  EOH
end