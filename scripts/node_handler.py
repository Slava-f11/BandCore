#! /usr/bin/env python

from shutil import copyfile
import os


class NodeHandler:
    def __init__(self, name, ip):
        self.name = name
        self.ip = ip
        self.server_home = "../nodes/" + self.name

    def restore_server(self):
        os.system("vagrant box remove " + self.name + " virtualbox")
        emptyBoxRef = "../nodes/box/UbuntuServer12.04amd64.box"
        destBoxRef = self.server_home + "/VM.box"
        copyfile(emptyBoxRef, destBoxRef)

    def create_vagrantfile(self):
        initial_vagrant_file_url = "../nodes/box/Vagrantfile"
        destVagrantFileURL = self.server_home + "/Vagrantfile"
        copyfile(initial_vagrant_file_url, destVagrantFileURL)
        initialVagrantFile = open(initial_vagrant_file_url)
        destVagrantFile = open(destVagrantFileURL, "w")
        replacements = {'config.vm.box =': 'config.vm.box = "' + self.name + '"',
                        'config.vm.network :private_network, ip:':
                            'config.vm.network :private_network, ip: "' + self.ip + '"'}
        for line in initialVagrantFile:
            for src, target in replacements.iteritems():
                line = line.replace(src, target)
            destVagrantFile.write(line)
        initialVagrantFile.close()
        destVagrantFile.close()

    def run_server(self):
        os.system("cd " + self.server_home + "; vagrant up;")


    def halt_server(self):
        os.system("cd " + self.server_home + "; vagrant halt;")


    def destroy_server(self):
        os.system("cd " + self.server_home + "; vagrant destroy --force;")


    def ssh_server(self):
        os.system("cd " + self.server_home + "; vagrant ssh;")
