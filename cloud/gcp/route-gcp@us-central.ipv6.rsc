/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-central"]
/ipv6 firewall address-list
add address=2600:1900:4000::/44 disabled=no list=route-gcp@us-central
add address=2600:1900:4070::/44 disabled=no list=route-gcp@us-central
