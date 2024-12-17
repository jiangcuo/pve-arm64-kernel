#!/bin/bash
debian/rules debian/control
rm build -rf
mkdir build && rsync -ra * .git build/
cd build
dpkg-buildpackage -b -us -uc
