#!/bin/bash
declare -x DIR
DIR="/home/vagrant/hybris/bin/platform/"
if [[ $EUID -ne 0 ]]; then
  echo "Run as sudo" 2>&1
  exit 1
else
  cd $DIR
  ant build all
  ./hybrisserver.sh
fi