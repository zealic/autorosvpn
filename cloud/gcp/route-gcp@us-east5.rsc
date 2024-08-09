/ip firewall address-list remove [/ip firewall address-list find list="route-gcp@us-east5"]
/ip firewall address-list
add address=34.1.16.0/20 disabled=no list=route-gcp@us-east5
add address=34.157.32.0/22 disabled=no list=route-gcp@us-east5
add address=34.157.160.0/22 disabled=no list=route-gcp@us-east5
add address=34.162.0.0/16 disabled=no list=route-gcp@us-east5
