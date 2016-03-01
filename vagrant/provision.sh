#!/usr/bin/env bash

echo "Starting Vagrant provisioning process..."

# Install core components
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y git nodejs

# Install needed global tools for kibana build
sudo npm install -g bower grunt-cli

# Let's clone the kibana repo.
# NOTE: `vagrant up` also exposes a copy of this `kibana` folder under `/vagrant`, but in order to ensure clean build, let's clone from scratch
git clone https://github.com/joola/ja-9041-algotec /home/vagrant/kibana

# Let's build kibana
cd /home/vagrant/kibana
npm install && bower install # install project deps

echo "--------------------------------------------------"
echo "Your vagrant instance is running."
echo ""
echo "Run 'vagrant ssh' to connect to the running box, then:"
echo "$ cd /home/vagrant/kibana"
echo "$ grunt build"
echo ""
echo "Your windows-ready build will be available at '/home/vagrant/kibana/build/dist/kibana-4.0.0-windows'."
