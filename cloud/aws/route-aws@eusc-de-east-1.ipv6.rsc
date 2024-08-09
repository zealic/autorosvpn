/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-aws@eusc-de-east-1"]
/ipv6 firewall address-list
add address=2a05:d013::/36 disabled=no list=route-aws@eusc-de-east-1
add address=2a05:d023::/36 disabled=no list=route-aws@eusc-de-east-1
