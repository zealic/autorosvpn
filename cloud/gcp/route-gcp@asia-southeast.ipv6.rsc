/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-southeast"]
/ipv6 firewall address-list
add address=2600:1900:4080::/44 disabled=no list=route-gcp@asia-southeast
add address=2600:1901:8170::/44 disabled=no list=route-gcp@asia-southeast
