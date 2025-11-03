/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-east7"]
/ipv6 firewall address-list
add address=2600:1901:8150::/44 disabled=no list=route-gcp@us-east7
add address=2600:1902:270::/44 disabled=no list=route-gcp@us-east7
