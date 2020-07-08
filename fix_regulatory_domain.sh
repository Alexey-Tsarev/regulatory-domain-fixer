#!/usr/bin/env sh

set -e
#set -x

curl -L https://github.com/Alexey-Tsarev/regulatory-domain-fixer/archive/master.zip -o regulatory-domain-fixer.zip
unzip regulatory-domain-fixer.zip
cd regulatory-domain-fixer-master

if [ "$(id -u -n)" == "root" ]; then
    ./apply.sh
else
    sudo ./apply.sh
fi

cd ..
rm -rf regulatory-domain-fixer.zip regulatory-domain-fixer-master
