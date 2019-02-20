#!/bin/bash
apt-get update&&apt-get install git
mkdir infra&&cd infra
git pull git@github.com:nik-weter/infra.git
chmod +x *.sh
bash install_ruby.sh
bash install_mongodb.sh
bash deploy.sh
