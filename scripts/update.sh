#!/bin/bash
pkg_version=`date +%Y%m%d`

git --git-dir linux/.git checkout FETCH_HEAD

echo "update debchangelog"
debchange -v 6.6-$pkg_version -D openeuler --force-distribution -U -M "Update to Linux $pkg_version"
