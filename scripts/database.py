#! /usr/bin/env python
from node_handler import NodeHandler
import sys

handler = NodeHandler("database", "192.168.33.12")
for command in sys.argv:
    if command == "up":
        handler.run_server()
    elif command == "restore":
        handler.restore_server()
    elif command == "halt":
        handler.halt_server()
    elif command == "destroy":
        handler.destroy_server()
    elif command == "ssh":
        handler.ssh_server()
