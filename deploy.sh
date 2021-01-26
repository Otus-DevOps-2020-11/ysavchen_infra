#!/bin/bash
echo "installing git..."
sudo apt update
sudo apt install -y git

if [[ $(git --version) != *"command not found"* ]]; then
  echo "git is installed"
else
  echo "ERROR: git is not installed" 1>&2
  exit 1
fi

echo "installing reddit..."
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

puma -d
ADDRESS=$(ps aux | grep puma | grep -oP "\(\K[^\)]+")

if [[ "$ADDRESS" == *"tcp"* ]]; then
  echo "reddit is installed"
else
  echo "ERROR: reddit is not installed" 1>&2
  exit 1
fi

echo "reddit is running at $ADDRESS"
