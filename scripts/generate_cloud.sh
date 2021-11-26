#!/bin/bash
if [[ "$(uname -s)" == "Darwin" ]]; then
  grep(){
  	ggrep "$@"
  }
fi

# Amazon Web Services
prepare_aws_route(){
  local url=https://www.gstatic.com/ipranges/cloud.json
  local file=$1
  local iplist=$2
  local zonelist=$3

  curl -fsSL -o $file ${url}

  grep -Po 'Prefix\": "\K([^"]+)' $file > $iplist
  grep -Po 'scope.+"\K([^"]+)' $file > $zonelist

  if test `cat $iplist | wc -l` -ne `cat $zonelist | wc -l`; then
    echo IP list and zones not equals.
    rm $file
    exit 1
  fi
  rm $file
}

prepare_azure_route(){
  local url=$(curl -s 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519' | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | grep ServiceTags_ | head -1 |  sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//')
  local file=$1
  local iplist=$2

  curl -fsSL -o $file ${url}
  cat $file | grep -Eo "([0-9]+\.+){3}[0-9]+\/[0-9]+" | sort -t . -n > $iplist
  rm $file
}

prepare_gcp_route(){
  local url=https://www.gstatic.com/ipranges/cloud.json
  local file=$1
  local iplist=$2
  local zonelist=$3

  curl -fsSL -o $file ${url}

  grep -Po 'Prefix\": "\K([^"]+)' $file > $iplist
  grep -Po 'scope.+"\K([^"]+)' $file > $zonelist

  if test `cat $iplist | wc -l` -ne `cat $zonelist | wc -l`; then
    echo IP list and zones not equals.
    rm $file
    exit 1
  fi
  rm $file
}

make_route(){
  local name=$1
  local iplist=$2
  echo "/ip firewall address-list remove [/ip firewall address-list find list=${name}]"
  echo "/ip firewall address-list"
  cat $iplist \
    | awk -v name=$name '{ print "add address=" $1, "disabled=no", "list=" name }'
}

make_route_regions(){
  local name=$1
  local iplist=$2
  local zonelist=$3
  local zonelist_trimed=$3.trimed
  local merged_file=$1.merged
  cat $zonelist | grep -Eo '.+[^0-9]' > $zonelist_trimed
  cat $zonelist_trimed | uniq \
    | awk -v name=$name '{ print "/ip firewall address-list remove [/ip firewall address-list find list=" name "@" $1 "]"}'
  echo "/ip firewall address-list"
  paste $iplist $zonelist > $merged_file

  while read line; do
  	local fields=($(echo "$line"))
    local address=${fields[0]}
    local region=$(echo "${fields[1]}" | grep -Eo '.+[^0-9]')
    echo "add address=$address disabled=no list=$name@$region"
  done < $merged_file
  rm $merged_file $zonelist_trimed
}

trim_ipv6() {
  local source=$1
  grep -v ":" $source
}

generate(){
  local provider=$1
  local iplist=${provider}_ips.list
  local zonelist=${provider}_zones.list
  prepare_${provider}_route ${provider}.json $iplist $zonelist
  # IP lists
  cat $iplist | trim_ipv6 > route-${provider}.txt
  # All routes
  make_route route-${provider} $iplist | trim_ipv6 > route-${provider}.rsc
  if [[ -f $zonelist ]]; then
  # Regions route
    make_route_regions route-${provider} $iplist $zonelist | trim_ipv6 > route-${provider}-regions.rsc
    rm $zonelist
  fi
  rm $iplist
}

generate aws
generate gcp
generate azure
