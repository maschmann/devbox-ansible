#!/bin/bash
if hash python 2>/dev/null; then
  echo "python already installed :-)"
else
  sudo apt-get update
  sudo apt-get -y install python-setuptools python-pip python-pycurl
fi