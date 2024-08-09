/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-east"]
/ipv6 firewall address-list
add address=2600:1900:4020::/44 disabled=no list=route-gcp@us-east
add address=2600:1900:4090::/44 disabled=no list=route-gcp@us-east
add address=2600:1901:8130::/44 disabled=no list=route-gcp@us-east
add address=2600:1901:8150::/44 disabled=no list=route-gcp@us-east
