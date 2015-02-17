# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vconfig|
    vconfig.vm.box = "asm/devbox"
    vconfig.vm.box_url = "http://vagrant.br0ken.de/debian/wheezy64/metadata.json"
    vconfig.vm.box_check_update = true

    vconfig.vm.define :devbox do |config|
        config.vm.provider :virtualbox do |v|
            # set memory to 1024MB
            v.customize [ "modifyvm", :id, "--memory", "1024" ]
            #v.gui = true #debugging
            v.name = "devbox"
            v.cpus = 1
        end

        config.vm.host_name = "devbox"
        config.vm.network :private_network, ip: "192.168.56.10"

        if Vagrant::Util::Platform.windows?
            config.vm.provision :shell, path: "windows.sh"
        else
            config.vm.provision :ansible do |ansible|
                ansible.playbook = "ansible/development.yml"
            end
        end
    end
end
