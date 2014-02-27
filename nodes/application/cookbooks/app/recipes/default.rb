execute "echo 'LC_ALL=en_US.UTF-8' >> /etc/environment"
execute "echo 'LANG=en_US.UTF-8' >> /etc/environment"

package "unzip"

cookbook_file "#{node["application"]["home"]}/BandCore.zip" do
  mode 0777
  owner node["application"]["owner"]
  group node["application"]["owner"]
  source "BandCore.zip"
  action :create
end

cookbook_file "#{node["application"]["home"]}/java.zip" do
  mode 0777
  owner node["application"]["owner"]
  group node["application"]["owner"]
  source "java.zip"
  action :create
end

bash "bootstrap_database" do
  user node["application"]["owner"]
  cwd node["application"]["home"]
  code <<-EOH
      unzip BandCore.zip
      unzip java.zip
      rm BandCore.zip
      rm java.zip
  EOH
end

execute "run_app" do
  cwd node["application"]["home"]
  command "./BandCore-1.0-SNAPSHOT/bin/bandcore &"
  user node["application"]["owner"]
  environment ({'JAVA_HOME' => "#{node["application"]["home"]}/java"})
end