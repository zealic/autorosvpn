/ip firewall address-list remove [/ip firewall address-list find list="route-aws@ap-southeast-6"]
/ip firewall address-list
add address=3.2.32.0/26 disabled=no list=route-aws@ap-southeast-6
add address=43.208.0.0/15 disabled=no list=route-aws@ap-southeast-6
add address=43.210.0.0/15 disabled=no list=route-aws@ap-southeast-6
