#!/bin/bash
set -eu #x

if ! $(grep -Eicq 'debian|buntu|mint' /etc/*release); then
   echo "This script is intended for debian based systems only, sorry."
   exit 1
fi

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm awscliv2.zip
rm -rf aws