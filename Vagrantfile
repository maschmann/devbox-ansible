# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vconfig|
    vconfig.vm.box = "vagrant-debian-wheezy64"
    vconfig.vm.box_url = "http://vagrant.br0ken.de/debian/wheezy64/v2/vagrant-debian-wheezy64.box"

    vconfig.vm.define :devbox do |config|
        config.vm.provider :virtualbox do |v|
            # set memory to 512MB
            v.customize [ "modifyvm", :id, "--memory", "512" ]
            #v.gui = true #debugging
            v.name = "devbox"
            v.cpus = 1
        end

        config.vm.host_name = "devbox"
        config.vm.network :private_network, ip: "192.168.56.10"

        config.vm.provision :ansible do |ansible|
            ansible.playbook = "ansible/development.yml"
            ansible.inventory_file = "ansible/development"
        end
    end
end