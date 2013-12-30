#! /usr/bin/env python
from shutil import copyfile

def restoreChefServer():
	emptyBoxRef = "../nodes/box/UbuntuServer12.04amd64.box"
	destBoxRef = "../nodes/chef-server/UbuntuServer12.04amd64.box"
	copyfile(emptyBoxRef, destBoxRef)

restoreChefServer()
