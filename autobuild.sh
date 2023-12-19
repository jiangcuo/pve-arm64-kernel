#!/bin/bash
git submodule update --init --depth=1
debian/rules debian/control
sudo apt install devscripts  rsync -y
yes | sudo mk-build-deps --install --remove
rm build -rf
mkdir build && rsync -ra * build/
cd build
dpkg-buildpackage -b -us -uc
