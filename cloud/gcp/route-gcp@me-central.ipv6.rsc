/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@me-central"]
/ipv6 firewall address-list
add address=2600:1900:5400::/44 disabled=no list=route-gcp@me-central
add address=2600:1901:81c0::/44 disabled=no list=route-gcp@me-central
