/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-east2"]
/ipv6 firewall address-list
add address=2600:1900:41a0::/44 disabled=no list=route-gcp@asia-east2
add address=2600:1902:30::/44 disabled=no list=route-gcp@asia-east2
