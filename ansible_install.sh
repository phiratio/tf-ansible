#!/bin/bash
set -eu #x

if ! grep -Eicq 'buntu' /etc/*release; then
   echo "This script is intended for ubuntu based systems only, sorry."
   exit 1
fi

sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible