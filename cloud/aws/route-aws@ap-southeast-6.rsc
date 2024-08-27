/ip firewall address-list remove [/ip firewall address-list find list="route-aws@ap-southeast-6"]
/ip firewall address-list
add address=3.102.0.0/15 disabled=no list=route-aws@ap-southeast-6
add address=182.24.0.0/14 disabled=no list=route-aws@ap-southeast-6
