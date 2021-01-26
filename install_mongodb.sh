#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

echo "installing mondodb..."
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

MONGO_STATUS=$(sudo systemctl status mongod)
if [[ "$MONGO_STATUS" == *"enabled"* ]]; then
  echo "mongod is enabled"
else
  echo "ERROR: mongod is not enabled" 1>&2
  exit 1
fi

if [[ "$MONGO_STATUS" == *"active (running)"* ]]; then
  echo "mongod is active (running)"
else
  echo "ERROR: mongod is not active (running)" 1>&2
  exit 1
fi

echo "mongodb is successfully installed"
