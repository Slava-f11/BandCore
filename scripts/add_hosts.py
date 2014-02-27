#! /usr/bin/env python
import re

def add_host(host, fqdn, ip):
    hosts = open("/etc/hosts", "a")
    hosts.write(ip + " " + fqdn + " " + host + "\n")
    hosts.close()

add_host("chefserver", "chefserver.bandbook.com", "192.168.33.10")
add_host("workstation", "workstation.bandbook.com", "192.168.33.11")
