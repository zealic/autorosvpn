/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-west3"]
/ipv6 firewall address-list
add address=2600:1900:40d0::/44 disabled=no list=route-gcp@europe-west3
add address=2600:1902:150::/44 disabled=no list=route-gcp@europe-west3
