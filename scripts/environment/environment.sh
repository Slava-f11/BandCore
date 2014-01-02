#! /bin/sh

up() {
    ./chef-server.py halt destroy
    ./chef-server.py restore up

    ./chef-workstation.py halt destroy
    ./chef-workstation.py restore up

    ./database.py halt destroy
    ./database.py restore up

    ./application.py halt destroy
    ./application.py restore up
}

down() {
    ./chef-server.py halt destroy
    ./chef-workstation.py halt destroy
    ./database.py halt destroy
    ./application.py halt destroy
}

cd ..

if [ "$1" = "up" ]; then
    up
#knife bootstrap 192.168.33.12 -x vagrant -P vagrant --sudo
#knife bootstrap 192.168.33.13 -x vagrant -P vagrant --sudo
elif [ "$1" = "down" ]; then
    down
fi

