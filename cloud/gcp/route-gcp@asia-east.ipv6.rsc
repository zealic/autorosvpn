/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-east"]
/ipv6 firewall address-list
add address=2600:1900:41a0::/44 disabled=no list=route-gcp@asia-east
add address=2600:1900:4030::/44 disabled=no list=route-gcp@asia-east
