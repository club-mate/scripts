#!/bin/bash
# author: https://github.com/club-mate
# little workaround to install latest umlet version due to sluggish AUR package maintainance 

git clone https://aur.archlinux.org/umlet.git/

cd umlet

sed -i 's@pkgver=15.0.0@pkgver=15.1@g' PKGBUILD #new version

sed -i 's@_pkgver=15_0@_pkgver=15_1@g' PKGBUILD #new version

sed -i 's@http://www.umlet.com/@https://www.umlet.com/download/@g' PKGBUILD #url fix

sed -i 's@0d77cc21066a3f8fb7f05f671d818177@57929dbd0dd4cf11be46538af6d06007@g' PKGBUILD #new md5sum

makepkg -si

exit 0
