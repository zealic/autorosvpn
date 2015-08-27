#!/bin/sh
RSC_FILE=address-list.rsc
echo "/ip firewall address-list remove [/ip firewall address-list find list=novpn]" > $RSC_FILE
echo "/ip firewall address-list" >> $RSC_FILE
wget -O- 'https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' \
  | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' \
  | awk -F\, '{print "add address=" $0 " disabled=no list=novpn" }' >> $RSC_FILE
