/ip firewall address-list remove [/ip firewall address-list find list="route-aws@eusc-de-east"]
/ip firewall address-list
add address=15.190.252.0/22 disabled=no list=route-aws@eusc-de-east
add address=15.190.80.0/20 disabled=no list=route-aws@eusc-de-east
add address=51.224.0.0/15 disabled=no list=route-aws@eusc-de-east
add address=51.226.0.0/15 disabled=no list=route-aws@eusc-de-east
add address=136.18.144.0/21 disabled=no list=route-aws@eusc-de-east
