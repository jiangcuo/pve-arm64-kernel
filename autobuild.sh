#!/bin/bash
sudo apt install devscripts  rsync -y
#git submodule update --init --depth=1
rm build -rf
mkdir build && rsync -ra * build/
cd build
debian/rules debian/control
yes | sudo mk-build-deps --install --remove
dpkg-buildpackage -b -us -uc
