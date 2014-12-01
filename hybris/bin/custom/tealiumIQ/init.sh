#!/bin/bash
declare -x DIR
declare -x MATCH
declare -x INSERT
declare -x FILE

DIR="/home/vagrant/hybris/bin/platform/"
MATCH="\t<\/extensions>"
INSERT="\t\t<extension dir=\"\$\{HYBRIS_BIN_DIR\}\/custom\/tealiumIQ\"\/>"
FILE="/home/vagrant/hybris/config/localextensions.xml"

if [[ $EUID -ne 0 ]]; then
  echo "Run as sudo" 2>&1
  exit 1
else
  cd $DIR
  ant initialize
  ./updateAddon.sh
  sed -i "s/$MATCH/$INSERT\n$MATCH/" $FILE
  ant addoninstall -Daddonnames="tealiumIQ" -DaddonStorefront.yacceleratorstorefront="yacceleratorstorefront"
  ./startServer.sh
fi