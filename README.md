# Description

A base setup for getting started with Ansible.

You need to have ansible and vagrant installed to use this.

There is a virtual machine that you can start to test your ansible playbooks. This is run by:

	cd vagrant
	vagrant up

The ansible dir has the outline directory structure and the inventory setup for just the vagrant VM that has just been setup.

hosts/local sets up a group called test with just the vagran VM in it
host_vars/ has just one file that matches the vagrant VM supplying the username and the ssh cert needed to log in to the VM

The playbook itself will put the file hello-world.txt in the root dir of the VM

To do this, run the command:

	cd ansible
	ansible-playbook hello.yml -i hosts/local

The main entrypoint is hello.yml. This defines the hosts as the hosts in the test group, how to become root and the roles that the machines in the group have. There is just one role; hello

The hello role is defined in the roles/hello dir. In that dir, there is a files dir and a tasks dir. The tasks dir has one file main.yml - this defines a copy task to copy the file in the files dir.

