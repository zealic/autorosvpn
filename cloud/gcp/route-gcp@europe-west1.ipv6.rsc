/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-west1"]
/ipv6 firewall address-list
add address=2600:1900:4010::/44 disabled=no list=route-gcp@europe-west1
add address=2600:1901:81b0::/44 disabled=no list=route-gcp@europe-west1
add address=2600:1901:81f0::/44 disabled=no list=route-gcp@europe-west1
