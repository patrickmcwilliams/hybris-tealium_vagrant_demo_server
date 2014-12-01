#!/bin/bash
declare -x DIR
DIR="/home/vagrant/hybris/bin/custom/tealiumIQ/"
if [[ $EUID -ne 0 ]]; then
  echo "Run as sudo" 2>&1
  exit 1
else
  if [ "$(ls -A $DIR)" ]; then
    find $DIR -type f -not -name '*.sh' | xargs rm -rf
    find $DIR -type d -not -wholename '*tealiumIQ/' | xargs rm -rf
  fi
  cd $DIR
  curl -L https://github.com/patrickmcwilliams/HybrisIntegration/tarball/master | tar zx --strip=5
fi
