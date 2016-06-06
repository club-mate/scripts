#!/bin/bash

killall qtox
cd ~
rm qtox qTox_build_linux_x86-64_release.tar.xz
wget  https://build.tox.chat/view/Clients/job/qTox_build_linux_x86-64_release/lastSuccessfulBuild/artifact/qTox_build_linux_x86-64_release.tar.xz
tar xf qTox_build_linux_x86-64_release.tar.xz
./qtox &

exit 0
