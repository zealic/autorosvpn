/ip firewall address-list remove [/ip firewall address-list find list="route-gcp@europe-west10"]
/ip firewall address-list
add address=34.1.160.0/20 disabled=no list=route-gcp@europe-west10
add address=34.32.0.0/17 disabled=no list=route-gcp@europe-west10
add address=34.152.80.0/23 disabled=no list=route-gcp@europe-west10
add address=34.177.36.0/23 disabled=no list=route-gcp@europe-west10
