/ip firewall address-list remove [/ip firewall address-list find list="route-gcp@europe-west9"]
/ip firewall address-list
add address=34.1.0.0/20 disabled=no list=route-gcp@europe-west9
add address=34.155.0.0/16 disabled=no list=route-gcp@europe-west9
add address=34.157.12.0/22 disabled=no list=route-gcp@europe-west9
add address=34.157.140.0/22 disabled=no list=route-gcp@europe-west9
add address=34.163.0.0/16 disabled=no list=route-gcp@europe-west9
