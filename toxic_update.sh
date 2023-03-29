#!/bin/bash
# download and install latest toxic version
#

killall toxic
rm *x86-64_release.tar.xz
rm -rf toxic-*/
url=`curl -s https://api.github.com/repos/Jfreegman/toxic/releases/latest | jq -r '.assets[] | select(.name|match("linux_x86-64.tar.xz$")) | .browser_download_url'`
wget $url
ls toxic-*.tar.xz | xargs -I{} tar -xvf {}
cd toxic*/
./run_toxic.sh

exit 0
