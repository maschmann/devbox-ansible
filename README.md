# devbox-ansible
A small Ubuntu 15.04 based vagrant box, provisioned with ansible

## What's inside?
devbox-ansible comes with a full web environment in mind.
Namely it has following modules preinstalled:

* nginx
* php-fpm
* MariaDb
* phpmyadmin
* phptools (phpunit, phploc, ...)

Also there's a separate user to run your web stuff (wwwdev) and a basic set of tool scripts for working with git or linking nginx configs from your repository directory to sites-enabled and much more :-)

## Configuration
Install ansible, python and vagrant.
After cloning the repository to your local environment, add your ssh public key to

    devbox-ansible/ansible/roles/user/files/authorized_keys
    
and your name and email address to group_vars:

    user_home_base: /home
    user: wwwdev

That should do it :-)

## First start
Goto the cloned repository and commandline this:

    user@yourpc:~/git/devbox-ansible$ ./up
    
This equals the vagrant up command but also sets a environment variable to suppress ansible's cowsay and provides a more readable output of the first provisioning. If you need provisioning later on, just vagrant provision or use the ./provision script withouth the cowsay.

## Connecting to the box
The IP represents the version of ubuntu you're using - in this case version 15.
You've got two options:

* vagrant ssh and then su wwwdev
* ssh wwwdev@192.158.56.15

I'd suggest you add something like 

    192.168.56.15 dev.local

Or similar to your local hosts file to ease your access to the virtual machine.
The "dev.local" part is the default address your nginx installation will listen to.


## Further steps in devbox development

For later releases of this devbox I will rely more on already established ansible galaxy packages. Namely Jeff Geerling's :-)