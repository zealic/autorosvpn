/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-southeast1"]
/ipv6 firewall address-list
add address=2600:1900:4080::/44 disabled=no list=route-gcp@asia-southeast1
add address=2600:1902:90::/44 disabled=no list=route-gcp@asia-southeast1
