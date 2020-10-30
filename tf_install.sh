#!/bin/bash
set -eu #x

if ! $(grep -Eicq 'debian|buntu|mint' /etc/*release); then
   echo "This script is intended for debian based systems only, sorry."
   exit 1
fi

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
$SHELL terraform -install-autocomplete