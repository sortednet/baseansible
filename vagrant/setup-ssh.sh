mkdir -p .ssh
cp /vagrant/ssh/* .ssh/
chown vagrant:vagrant .ssh/*
cat .ssh/ansible_id.pub >> .ssh/authorized_keys
