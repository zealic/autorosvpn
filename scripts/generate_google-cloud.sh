#!/bin/bash
# Google Cloud

make_gcloud(){
  local file=$1
  local iplist=google-cloud.txt
  local zonelist=google-cloud-zone.list
  grep -Po 'Prefix\": "\K([^"]+)' $file > $iplist
  grep -Po 'scope.+"\K([^"]+)' $file > $zonelist

  if test `cat $iplist | wc -l` -ne `cat $zonelist | wc -l`; then
    echo IP list and zones not equals.
    exit 1
  fi  

  # ROS Scripts
  echo "/ip firewall address-list remove [/ip firewall address-list find list=google-cloud]"
  cat $zonelist | uniq \
    | awk '{ print "/ip firewall address-list remove [/ip firewall address-list find list=google-cloud-" $1 "]"}'
  echo "/ip firewall address-list"
  cat $iplist \
    | awk '{ print "add address=" $1, "disabled=no", "list=google-cloud" }'
  paste $iplist $zonelist \
    | awk '{ print "add address=" $1, "disabled=no", "list=google-cloud-" $2 }'

  rm $zonelist
}

curl -fsSL 'https://www.gstatic.com/ipranges/cloud.json' > google-cloud.json
make_gcloud google-cloud.json > google-cloud.rsc
# Only IPv4
grep -v ":" google-cloud.rsc > google-cloud-ipv4.rsc
mv google-cloud-ipv4.rsc google-cloud.rsc
grep -v ":" google-cloud.txt > google-cloud-ipv4.txt
mv google-cloud-ipv4.txt google-cloud.txt
rm google-cloud.json
