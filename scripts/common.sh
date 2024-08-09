write_rsc(){
  local name=$1
  echo "/ip firewall address-list remove [/ip firewall address-list find list=\"${name}\"]"
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
  done | trim_ipv6
}

trim_ipv6() {
  local source=$1
  grep -v ":" $source
}
