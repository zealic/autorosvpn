/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-east5"]
/ipv6 firewall address-list
add address=2600:1901:8130::/44 disabled=no list=route-gcp@us-east5
add address=2600:1902:260::/44 disabled=no list=route-gcp@us-east5
