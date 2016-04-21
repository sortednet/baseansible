# Description

A base setup for getting started with Ansible. This is an Ansible 'hello-world'

# Pre-requisites
You need to have [ansible](http://docs.ansible.com/ansible/intro_installation.html) and [vagrant](https://www.vagrantup.com/docs/installation/) installed to use this.


This project has a VM to test the playbooks on and a very basic ansible structure that is just enough to do a 'hello world'

# The Virtual machine

The VM is started by:

	cd vagrant
	vagrant up


# Ansible

The ansible dir has the outline directory structure and the inventory setup for just the vagrant VM that has just been setup.


*hosts/local*                   Sets up a group called test with just the vagrant VM in it
*host_vars/*                    Has just one file that matches the vagrant VM supplying the username and the ssh cert needed to log in to the VM
*hello.yml*                     The main entrypoint This defines the hosts as the hosts in the test group, how to become root and the roles that the machines in the group have. There is just one role; hello
*roles/hello/*                  The file to define the hello role
*roles/hello/files*             The files refered to by the hello task
*roles/hello/tasks/main.yml*    The description of the tasks to run. This just has one [ansible module](http://docs.ansible.com/ansible/modules_by_category.html) - [copy](http://docs.ansible.com/ansible/copy_module.html) that copies a file to the destination machines


To run the playbook:

	cd ansible
	ansible-playbook hello.yml -i hosts/local


To check it has worked, log in to the VM

	cd vagrant
	vagrant ssh
	ls /

You should see the hello-world.txt file in the root dir
