Setup
=====

Copy your ssh key into the vagrant box:

    remote-prompt> ssh zaccaria@macbook 'cat .ssh/id_rsa.pub' >> ~/.ssh/authorized_keys

Fix up `host-list.ini` to point to the remote machine ssh port.

Deployment commands
===================

To begin a deploy:

    `ansible-playbook deploy.yml -i host-list.ini --ask-vault-pass -v -K`

where:

    * `-K` asks for the sudo password.
    * `-i` specifies the target host(s)
    * `deploy.yml` is the top level deployment file
