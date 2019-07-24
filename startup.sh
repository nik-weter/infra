#!/bin/bash
sudo apt-get update&&sudo apt-get install git
#mkdir infra&&cd infra
sudo -u appuser git clone https://github.com/nik-weter/infra.git /home/appuser/infra
cd /home/appuser/infra
chmod +x *.sh
sudo -u appuser bash install_ruby.sh
bash install_mongodb.sh
sudo -u appuser bash deploy.sh
