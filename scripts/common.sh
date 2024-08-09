if [[ "$(uname -s)" == "Darwin" ]]; then
  grep(){
    ggrep "$@"
  }
fi

match_ipv6(){
  grep -Eo "((([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])))(\/[0-9]+)?" | sort -t : -n
}

write_rsc(){
  local name=$1
  echo "/ip firewall address-list remove [/ip firewall address-list find list=\"${name}\"]"
  echo "/ip firewall address-list"
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "add address=$address disabled=no list=$name"
  done
}

write_rsc_ipv6(){
  local name=$1
  echo "/ipv6 firewall address-list remove [/ipv6 firewall address-list find list=\"${name}\"]"
  echo "/ipv6 firewall address-list"
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "add address=$address disabled=no list=$name"
  done
}

write_txt(){
  while read line; do
    local fields=($(echo "$line"))
    local address=${fields[0]}
    echo "$address"
  done
}

trim_ipv6() {
  grep -v ":" | uniq | sort -V
}

only_ipv6() {
  grep ":" | uniq | sort -t : -V
}
