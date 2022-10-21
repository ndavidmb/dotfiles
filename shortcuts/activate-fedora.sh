#!/bin/bash#

cp -i ./latam /usr/share/X11/xkb/symbols/
cp -i ./latin /usr/share/X11/xkb/symbols/

dnf copr enable fszymanski/interception-tools
dnf install interception-tools


mkdir -p /etc/interception/dual-function-keys
cp ./my-mappings.yaml /etc/interception/dual-function-keys

mkdir -p /etc/interception/udevmon.d/
cp ./my-keyboard.yaml /etc/interception/udevmon.d
