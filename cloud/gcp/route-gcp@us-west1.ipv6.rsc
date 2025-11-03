/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-west1"]
/ipv6 firewall address-list
add address=2600:1900:4040::/44 disabled=no list=route-gcp@us-west1
add address=2600:1902:290::/44 disabled=no list=route-gcp@us-west1
