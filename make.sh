#!/usr/bin/env sh

set -e

cd wireless-regdb
make
cp -f db.txt regulatory.bin regulatory.db regulatory.db.p7s "$(id -u -n).key.pub.pem" "$(id -u -n).x509.pem" ../
cd - > /dev/null
