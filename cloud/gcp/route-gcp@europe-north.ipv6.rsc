/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-north"]
/ipv6 firewall address-list
add address=2600:1900:42a0::/44 disabled=no list=route-gcp@europe-north
add address=2600:1900:4150::/44 disabled=no list=route-gcp@europe-north
