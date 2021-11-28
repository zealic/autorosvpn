#!/bin/bash
WHOIS3="docker run -i --rm zealic/whois3"

prepare_cloudflare_route(){
  local url="https://api.cloudflare.com/client/v4/ips"
  local file=$1
  local iplist=$2

  curl -fsSL -o $file ${url}
  cat $file | tr -d '\\' | grep -Eo "([0-9]+\.+){3}[0-9]+\/[0-9]+" | sort -t . -n > $iplist
  rm $file
}

prepare_mikrotik_route(){
  local whois_host=riswhois.ripe.net
  local asn=51894
  local iplist=$2
  ${WHOIS3} -h $whois_host -i $asn | grep route: | awk '{print $2}' | sort -t . -n > $iplist
}

generate(){
  local site=$1
  local name=route-$site
  local iplist=${site}_ips.list

  echo Generating $site routes...
  if [[ -d sites/$site ]]; then
    rm -r sites/$site
  fi
  mkdir -p sites/$site

  pushd sites/$site > /dev/null
  prepare_${site}_route ${site}.json $iplist

  cat $iplist | write_rsc ${name} > ${name}.rsc
  cat $iplist | write_txt ${name} > ${name}.txt

  rm $iplist
  popd > /dev/null
}

write_rsc(){
  local name=$1
  echo "/ip firewall address-list remove [/ip firewall address-list find list=\"${name}\""
  echo "/ip firewall address-list"
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "add address=$address disabled=no list=$name"
  done | trim_ipv6
}

write_txt(){
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "$address"
  done | trim_ipv6 | sort -t . -n
}

trim_ipv6() {
  local source=$1
  grep -v ":" $source
}

generate cloudflare
generate mikrotik
