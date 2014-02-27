#! /usr/bin/env python
from node_handler import NodeHandler
from shutil import copyfile
import sys
import os


def run_server():
    os.system("cd ../BandCore; play clean compile dist")
    from_dist_app_url = "../BandCore/target/universal/BandCore-1.0-SNAPSHOT.zip"
    to_dist_app_url = "../nodes/application/cookbooks/app/files/default/BandCore.zip"
    copyfile(from_dist_app_url, to_dist_app_url)
    handler.run_server()


handler = NodeHandler("application", "192.168.33.13")
for command in sys.argv:
    if command == "up":
        run_server()
    elif command == "vagrantfile":
        handler.create_vagrantfile()
    elif command == "restore":
        handler.restore_server()
    elif command == "halt":
        handler.halt_server()
    elif command == "destroy":
        handler.destroy_server()
    elif command == "ssh":
        handler.ssh_server()
