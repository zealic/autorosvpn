/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-aws@eusc-de-east"]
/ipv6 firewall address-list
add address=2a05:d013::/36 disabled=no list=route-aws@eusc-de-east
add address=2a05:d023::/36 disabled=no list=route-aws@eusc-de-east
