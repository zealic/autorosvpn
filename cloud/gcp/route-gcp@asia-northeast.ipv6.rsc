/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-northeast"]
/ipv6 firewall address-list
add address=2600:1900:41d0::/44 disabled=no list=route-gcp@asia-northeast
add address=2600:1900:4050::/44 disabled=no list=route-gcp@asia-northeast
add address=2600:1901:8180::/44 disabled=no list=route-gcp@asia-northeast
