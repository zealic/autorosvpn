/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-west3"]
/ipv6 firewall address-list
add address=2600:1900:4170::/44 disabled=no list=route-gcp@us-west3
add address=2600:1902:2b0::/44 disabled=no list=route-gcp@us-west3
