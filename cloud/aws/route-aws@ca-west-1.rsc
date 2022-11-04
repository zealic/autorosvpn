/ip firewall address-list remove [/ip firewall address-list find list="route-aws@ca-west-1"]
/ip firewall address-list
add address=3.2.42.192/26 disabled=no list=route-aws@ca-west-1
add address=15.177.100.0/24 disabled=no list=route-aws@ca-west-1
add address=15.190.48.0/20 disabled=no list=route-aws@ca-west-1
add address=15.190.8.0/22 disabled=no list=route-aws@ca-west-1
add address=40.176.0.0/15 disabled=no list=route-aws@ca-west-1
add address=40.178.0.0/15 disabled=no list=route-aws@ca-west-1
add address=99.151.168.0/21 disabled=no list=route-aws@ca-west-1
