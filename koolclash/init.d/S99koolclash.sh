#!/bin/sh /etc/rc.common
#
# Copyright (C) 2015 OpenWrt-dist
# Copyright (C) 2016 fw867 <ffkykzs@gmail.com>
# Copyright (C) 2016 sadog <sadoneli@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

START=99
STOP=15

source /koolshare/scripts/base.sh

if [ ! -f "$KSROOT/koolclash/config/status" ]; then
    touch $KSROOT/koolclash/config/status
    echo '0' >$KSROOT/koolclash/config/status
    clash_status="0"
else
    clash_status=$(cat "$KSROOT/koolclash/config/status")
fi

start() {
    [ "$clash_status" == "1" ] && sh /koolshare/scripts/koolclash_sontrol.sh start
}

stop() {
    sh /koolshare/scripts/koolclash_sontrol.sh start
}