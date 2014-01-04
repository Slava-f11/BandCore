#! /bin/sh

up() {
    up_chef_server
    up_database
    up_application
    up_chef_workstation
}

up_chef_server() {
    ./chef-server.py halt destroy
    ./chef-server.py restore up
}

up_chef_workstation() {
    ./chef-workstation.py halt destroy
    ./chef-workstation.py restore up
}

up_application() {
    ./application.py halt destroy
    ./application.py restore up
}

up_database() {
    ./database.py halt destroy
    ./database.py restore up
}

down() {
    ./chef-server.py halt destroy
    ./chef-workstation.py halt destroy
    ./database.py halt destroy
    ./application.py halt destroy
}

cd ..

if [ "$1" = "up" ]; then
    if [ "$2" = "chef_server" ]; then
        pwd
        sudo ./add_hosts.py;
        up_chef_server
    elif [ "$2" = "chef_workstation" ]; then
        sudo ./add_hosts.py;
        up_chef_workstation
    elif [ "$2" = "database" ]; then
        sudo ./add_hosts.py;
        up_database
    elif [ "$2" = "application" ]; then
        sudo ./add_hosts.py;
        up_application
    elif [ "$2" = "all" ]; then
        sudo ./add_hosts.py;
        up
    else
        echo "None will be run"
    fi
elif [ "$1" = "down" ]; then
    down
fi

