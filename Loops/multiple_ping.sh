#!/bin/bash
# Purpose: Ping all of the IP addresses associated with my domain name www.cyberciti.biz
# Name: find-ping-time.sh
# Author: Vivek Gite under GPL v2.x+
# -----------------------------------
ips="$(host -t a www.cyberciti.biz | awk '{ print $4}')"
for i in $ips; do ping -q -c 4 "$i"; done