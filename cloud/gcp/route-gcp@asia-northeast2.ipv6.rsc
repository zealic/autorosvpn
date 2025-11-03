/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-northeast2"]
/ipv6 firewall address-list
add address=2600:1900:41d0::/44 disabled=no list=route-gcp@asia-northeast2
add address=2600:1902:50::/44 disabled=no list=route-gcp@asia-northeast2
