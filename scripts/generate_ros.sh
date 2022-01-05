
make_ros() {
  local file=$1
  local name=$2
  local lan=$3
  echo "/ip firewall address-list remove [/ip firewall address-list find list=$name]"
  echo "/ip firewall address-list"
  if [[ ! -z "$lan" ]]; then
    echo "add address=10.0.0.0/8 disabled=no list=$name"
    echo "add address=172.16.0.0/12 disabled=no list=$name"
    echo "add address=192.168.0.0/16 disabled=no list=$name"
  fi
  while read line; do
    echo "add address=$line disabled=no list=$name"
  done < $file
}

make_ros_ipv6() {
  local file=$1
  local name=$2
  local lan=$3
  echo "/ipv6 firewall address-list remove [/ip firewall address-list find list=$name]"
  echo "/ipv6 firewall address-list"
  if [[ ! -z "$lan" ]]; then
    echo "add address=fd00::/8 disabled=no list=$name"
  fi
  while read line; do
    echo "add address=$line disabled=no list=$name"
  done < $file
}

for file in *.txt; do
  name=${file%.*}
  if [ -z ${file##*.ipv6.txt} ]; then
    make_ros_ipv6 $file $name > $name.rsc
  else
    make_ros $file $name > $name.rsc
  fi
done

# Generate backward Compatibility address-list.rsc
make_ros chnroutes.txt novpn yes > address-list.rsc
make_ros_ipv6 chnroutes.ipv6.txt novpn yes > address-list.ipv6.rsc
