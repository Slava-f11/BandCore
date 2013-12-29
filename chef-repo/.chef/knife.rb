current_dir = File.dirname(__FILE__)
  user = ENV['OPSCODE_USER'] || ENV['USER']
  node_name                user
  client_key               "#{current_dir}/chef-webui.pem"
  validation_client_name   "chef-validator"
  validation_key           "#{current_dir}/chef-validator.pem"
  chef_server_url          "https://127.0.0.1"
  cookbook_path            ["#{current_dir}/../cookbooks"]
