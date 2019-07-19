#!/bin/bash
apt-get update&&apt-get install git
#mkdir infra&&cd infra
git clone https://github.com/nik-weter/infra.git
cd infra
chmod +x *.sh
bash install_ruby.sh
bash install_mongodb.sh
bash deploy.sh
