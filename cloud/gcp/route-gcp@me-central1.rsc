/ip firewall address-list remove [/ip firewall address-list find list="route-gcp@me-central1"]
/ip firewall address-list
add address=34.1.32.0/20 disabled=no list=route-gcp@me-central1
add address=34.18.0.0/16 disabled=no list=route-gcp@me-central1
add address=34.157.126.0/23 disabled=no list=route-gcp@me-central1
add address=34.157.252.0/23 disabled=no list=route-gcp@me-central1
