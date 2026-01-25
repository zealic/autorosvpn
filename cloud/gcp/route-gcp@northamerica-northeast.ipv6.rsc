/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@northamerica-northeast"]
/ipv6 firewall address-list
add address=2600:1900:40e0::/44 disabled=no list=route-gcp@northamerica-northeast
add address=2600:1900:41e0::/44 disabled=no list=route-gcp@northamerica-northeast
