#!/bin/bash
sudo apt install devscripts  rsync -y
yes | sudo mk-build-deps --install --remove
git submodule update --init --depth=1
mkdir build && rsync -ra * build/
cd build
dpkg-buildpackage -b -us -uc
