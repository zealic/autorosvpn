/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-south1"]
/ipv6 firewall address-list
add address=2600:1900:40a0::/44 disabled=no list=route-gcp@asia-south1
add address=2600:1902:70::/44 disabled=no list=route-gcp@asia-south1
