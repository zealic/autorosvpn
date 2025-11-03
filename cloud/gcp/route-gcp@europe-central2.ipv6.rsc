/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-central2"]
/ipv6 firewall address-list
add address=2600:1900:4140::/44 disabled=no list=route-gcp@europe-central2
add address=2600:1902:d0::/44 disabled=no list=route-gcp@europe-central2
