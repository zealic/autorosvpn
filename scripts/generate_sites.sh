#!/usr/bin/env bash
source $(dirname "$0")/common.sh
WHOIS_HOST=riswhois.ripe.net
WHOIS3="docker run -i --rm zealic/whois3 -h $WHOIS_HOST"

prepare_cloudflare_route(){
  local url="https://api.cloudflare.com/client/v4/ips"
  local file=$1
  local iplist=$2

  curl -fsSL -o $file ${url}
  cat $file | tr -d '\\' | grep -Eo "([0-9]+\.+){3}[0-9]+\/[0-9]+" | sort -t . -n > $iplist
  cat $file | tr -d '\\' | match_ipv6 >> $iplist
  rm $file
}

prepare_github_route(){
  local url="https://api.github.com/meta"
  local file=$1
  local iplist=$2

  curl -fsSL -o $file ${url}
  cat $file | tr -d '\\' | grep -Eo "([0-9]+\.+){3}[0-9]+\/[0-9]+" | sort -t . -n > $iplist
  cat $file | tr -d '\\' | match_ipv6 >> $iplist
  rm $file
}

prepare_mikrotik_route(){
  local asn=51894
  local iplist=$2
  ${WHOIS3} -i $asn | grep -Eo "route[6]?:.+" | awk '{print $2}' | sort -t . -n > $iplist
}

prepare_valve_route(){
  local asn=32590
  local iplist=$2
  ${WHOIS3} -i $asn | grep -Eo "route[6]?:.+" | awk '{print $2}' | sort -t . -n > $iplist
}

prepare_telegram_route(){
  # data source:
  # - https://core.telegram.org/resources/cidr.txt
  # - https://bgpview.io/search/Telegram
  # - https://docs.pyrogram.org/faq/what-are-the-ip-addresses-of-telegram-data-centers
  local asn_list=(44907 59930 62014 62041 211157)
  local iplist=$2
  for asn in ${asn_list[@]}; do
    ${WHOIS3} -i $asn | grep -Eo "route[6]?:.+" | awk '{print $2}' | sort -t . -n >> $iplist
  done
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

  cat $iplist | sort -t . -n | trim_ipv6 | write_rsc ${name} > ${name}.rsc
  cat $iplist | sort -t : -n | only_ipv6 | write_rsc_ipv6 ${name} > ${name}.ipv6.rsc
  cat $iplist | sort -t . -n | trim_ipv6 | write_txt ${name} > ${name}.txt
  cat $iplist | sort -t : -n | only_ipv6 | write_txt ${name} > ${name}.ipv6.txt

  rm $iplist
  popd > /dev/null
}

generate cloudflare
generate github
generate mikrotik
generate telegram
generate valve
