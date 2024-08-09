/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-south"]
/ipv6 firewall address-list
add address=2600:1900:40a0::/44 disabled=no list=route-gcp@asia-south
add address=2600:1900:41b0::/44 disabled=no list=route-gcp@asia-south
