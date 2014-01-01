log_level                :info
log_location             STDOUT
node_name                'vagrant'
client_key               '/home/vagrant/.chef/vagrant.pem'
validation_client_name   'chef-validator'
validation_key           '.chef/chef-validator.pem'
chef_server_url          'https://192.168.33.10'
cache_type               'BasicFile'
cache_options( :path => '/home/vagrant/.chef/checksums' )