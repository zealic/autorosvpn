/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-northeast3"]
/ipv6 firewall address-list
add address=2600:1901:8180::/44 disabled=no list=route-gcp@asia-northeast3
add address=2600:1902:60::/44 disabled=no list=route-gcp@asia-northeast3
