#!/bin/bash
echo "installing ruby..."
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

if [[ $(ruby -v) != *"command not found"* ]]; then
  echo "ruby-full is installed"
else
  echo "ERROR: ruby-full is not installed" 1>&2
  exit 1
fi

if [[ $(bundler -v) != *"command not found"* ]]; then
  echo "ruby-bundler is installed"
else
  echo "ERROR: ruby-bundler is not installed" 1>&2
  exit 1
fi

echo "ruby is successfully installed"
