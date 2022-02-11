/ip firewall address-list remove [/ip firewall address-list find list="route-aws@il-central"]
/ip firewall address-list
add address=13.248.72.0/24 disabled=no list=route-aws@il-central
add address=16.12.12.0/23 disabled=no list=route-aws@il-central
add address=16.12.14.0/24 disabled=no list=route-aws@il-central
