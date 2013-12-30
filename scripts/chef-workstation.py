#! /usr/bin/env python
__author__ = 'slava'
#! /usr/bin/env python

from shutil import copyfile
import os
import sys

SERVER_HOME = "../nodes/chef-workstation"


def restoreServer():
    os.system("vagrant box remove workstation virtualbox")
    emptyBoxRef = "../nodes/box/UbuntuServer12.04amd64.box"
    destBoxRef = SERVER_HOME + "/VM.box"
    copyfile(emptyBoxRef, destBoxRef)


def runServer():
    os.system("cd " + SERVER_HOME + "; vagrant up;")


def halt_server():
    os.system("cd " + SERVER_HOME + "; vagrant halt;")


def destroyServer():
    os.system("cd " + SERVER_HOME + "; vagrant destroy;")


def destroyServer():
    os.system("cd " + SERVER_HOME + "; vagrant destroy;")


def sshServer():
    os.system("cd " + SERVER_HOME + "; vagrant ssh;")


for command in sys.argv:
    if command == "up":
        runServer()
        break
    elif command == "restore":
        restoreServer()
        break
    elif command == "halt":
        halt_server()
        break
    elif command == "destroy":
        destroyServer()
        break
    elif command == "ssh":
        sshServer()
        break

