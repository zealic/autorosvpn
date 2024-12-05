/ip firewall address-list remove [/ip firewall address-list find list="route-gcp@us-west8"]
/ip firewall address-list
add address=34.2.32.0/20 disabled=no list=route-gcp@us-west8
add address=34.37.0.0/16 disabled=no list=route-gcp@us-west8
add address=34.128.46.0/23 disabled=no list=route-gcp@us-west8
add address=34.128.62.0/23 disabled=no list=route-gcp@us-west8
