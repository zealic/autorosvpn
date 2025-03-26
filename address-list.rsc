/ip firewall address-list remove [/ip firewall address-list find list=novpn]
/ip firewall address-list
add address=10.0.0.0/8 disabled=no list=novpn
add address=172.16.0.0/12 disabled=no list=novpn
add address=192.168.0.0/16 disabled=no list=novpn
