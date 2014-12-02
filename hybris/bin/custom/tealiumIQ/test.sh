#!/bin/bash
declare -x DIR
DIR="/home/vagrant/hybris/bin/custom/tealiumIQ/"
if [[ $EUID -ne 0 ]]; then
  echo "Run as sudo" 2>&1
  exit 1
else
  if [ ! -d "/home/vagrant/setup-config" ]; then
    mkdir /home/vagrant/setup-config
    chown vagrant:vagrant /home/vagrant/setup-config
  fi
  if [ ! -e "/home/vagrant/setup-config/git.hash" ]; then
    
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"

    echo -n "[Getting .git hash] ${spin[0]}"
    while [ -n "$(git ls-remote git://github.com/patrickmcwilliams/HybrisIntegration.git HEAD &> /home/vagrant/setup-config/git.hash 2>&1 /dev/null)" ]
    do
      echo "test"
      for i in "${spin[@]}"
      do
            echo -ne "\b$i"
            sleep 0.1
      done
    done
  fi
  if [ "$(ls -A $DIR)" ]; then
    find $DIR -type f -not -name '*.sh' | xargs rm -rf
    find $DIR -type d -not -wholename '*tealiumIQ/' | xargs rm -rf
  fi
  cd $DIR
  echo "unpacking curent addon from git repo"
  curl -Ls https://github.com/patrickmcwilliams/HybrisIntegration/tarball/master | tar zx --strip=5
fi
