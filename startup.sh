#!/bin/bash
apt-get update&&apt-get install git
git clone git@github.com:nik-weter/infra.git
cd infra
chmod +x *.sh
bash install_ruby.sh
bash install_mongodb.sh
bash deploy.sh
