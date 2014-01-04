#! /usr/bin/env python
from node_handler import NodeHandler
import sys

handler = NodeHandler("chef-workstation", "192.168.33.11")
for command in sys.argv:
    if command == "up":
        handler.run_server()
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