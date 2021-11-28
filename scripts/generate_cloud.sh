#!/bin/bash
if [[ "$(uname -s)" == "Darwin" ]]; then
  grep(){
  	ggrep "$@"
  }
fi

# Amazon Web Services
prepare_aws_route(){
  local url=https://ip-ranges.amazonaws.com/ip-ranges.json
  local file=$1
  local iplist=$2
  local zonelist=$3

  curl -fsSL -o $file ${url}

  grep -Po 'prefix\": "\K([^"]+)' $file > $iplist
  grep -Po 'region\": "\K([^"]+)' $file | tr '[:upper:]' '[:lower:]' > $zonelist

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
  grep -Po 'scope\": "\K([^"]+)' $file | tr '[:upper:]' '[:lower:]' > $zonelist

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
  cat $iplist | sort -t . -n \
    | awk -v name=$name '{ print "add address=" $1, "disabled=no", "list=" name }'
}

make_route_zones(){
  local name=$1
  local iplist=$2
  local zonelist=$3
  local zonelist_trimed=$3.zones.trimed
  local merged_file=$1.zones.merged
  cat $zonelist | grep -Eo '^[a-z]+(-[a-z]+){0,}' > $zonelist_trimed
  if test `cat $zonelist | wc -l` -ne `cat $zonelist_trimed | wc -l`; then
    echo Bad trim zonelist. >&2
    exit 1
  fi
  cat $zonelist_trimed | sort | uniq \
    | awk -v name=$name '{ print "/ip firewall address-list remove [/ip firewall address-list find list=" name "@" $1 "]"}'
  echo "/ip firewall address-list"
  paste $iplist $zonelist $zonelist_trimed | sort -k2 > $merged_file

  while read line; do
  	local fields=($(echo "$line"))
    local address=${fields[0]}
    local zone=${fields[2]}
    echo "add address=$address disabled=no list=$name@$zone"
  done < $merged_file
  rm $merged_file $zonelist_trimed
}

make_route_zones(){
  local name=$1
  local iplist=$2
  local zonelist=$3
  local zonelist_trimed=$3.zones.trimed
  local merged_file=$1.zones.merged
  cat $zonelist | grep -Eo '^[a-z]+(-[a-z]+){0,}' > $zonelist_trimed
  if test `cat $zonelist | wc -l` -ne `cat $zonelist_trimed | wc -l`; then
    echo Bad trim zonelist. >&2
    exit 1
  fi

  paste $iplist $zonelist $zonelist_trimed | sort -k2 > $merged_file

  # Zones
  cat $zonelist_trimed | sort | uniq |
  {
    while read zone; do
      grep -E "${zone}$" $merged_file | sort -t . -n | write_rsc $name@$zone > $name@$zone.rsc
      grep -E "${zone}$" $merged_file | write_txt > $name@$zone.txt
    done
  }

  # Subzones
  cat $zonelist | sort | uniq |
  {
    while read subzone; do
      grep "${subzone}" $merged_file | sort -t . -n | write_rsc $name@$subzone > $name@$subzone.rsc
      grep "${subzone}" $merged_file | write_txt > $name@$subzone.txt
    done
  }

  # All
  cat $zonelist_trimed | sort | uniq | awk -v name=$name '{ print name "@" $1 ".rsc" }' | xargs cat > $name-zones.rsc 

  rm $merged_file $zonelist_trimed
}

make_route_zone(){
  local zone=$1
  echo "/ip firewall address-list remove [/ip firewall address-list find list=\"${zone}\""
  echo "/ip firewall address-list"
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "add address=$address disabled=no list=$name@$zone"
  done
}

make_route_regions(){
  local name=$1
  local iplist=$2
  local zonelist=$3
  local zonelist_trimed=$3.regions.trimed
  local merged_file=$1.regions.merged
  cat $zonelist | grep -Eo '^[a-z]+' > $zonelist_trimed
  if test `cat $zonelist | wc -l` -ne `cat $zonelist_trimed | wc -l`; then
    echo Bad trim zonelist. >&2
    exit 1
  fi

  paste $iplist $zonelist $zonelist_trimed | sort -k2 > $merged_file

  # Regions
  cat $zonelist_trimed | sort | uniq |
  {
    while read region; do
      grep -E "${region}$" $merged_file | sort -t . -n |write_rsc $name@$region > $name@$region.rsc
      grep -E "${region}$" $merged_file | write_txt > $name@$region.txt
    done
  }

  # All
  cat $zonelist_trimed | sort | uniq | awk -v name=$name '{ print name "@" $1 ".rsc" }' | xargs cat > $name-regions.rsc 

  rm $merged_file $zonelist_trimed
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

generate(){
  local provider=$1
  local iplist=${provider}_ips.list
  local zonelist=${provider}_zones.list

  echo Generating $provider routes...
  if [[ -d $provider ]]; then
    rm -r $provider
  fi
  mkdir $provider

  pushd $provider > /dev/null
  prepare_${provider}_route ${provider}.json $iplist $zonelist
  # IP lists
  cat $iplist | trim_ipv6 | sort -t . -n > route-${provider}.txt
  # All routes
  make_route route-${provider} $iplist | trim_ipv6 > route-${provider}.rsc
  if [[ -f $zonelist ]]; then
    # Regions route
    make_route_regions route-${provider} $iplist $zonelist
    # Zones route
    make_route_zones   route-${provider} $iplist $zonelist
    rm $zonelist
  fi
  rm $iplist
  popd > /dev/null
}

generate aws
generate azure
generate gcp

