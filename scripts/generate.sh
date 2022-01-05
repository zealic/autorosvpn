#!/bin/bash
# chnroutes
curl -fsSL 'https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' \
  | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > chnroutes.txt

curl -fsSL 'https://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' \
  | awk -F\| '/CN\|ipv6/ { printf("%s/%d\n", $4, $5) }' > chnroutes.ipv6.txt
