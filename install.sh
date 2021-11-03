#!/bin/bash
set -x
set -e
PATH=/usr/local/bin:$PATH

# install ansible
sudo dnf install ansible

# install git
sudo dnf install git

# get ansible script
if [ ! -d ansible-awx ]; then
    git clone https://github.com/alexberny/ansible-awx.git
    cd ansible-awx
else
    cd ansible-awx
    git pull
fi 


# install ansible galaxy dep
# ansible-galaxy install -r requirements.yml

ansible-playbook awx-install.yml --ask-become-pass