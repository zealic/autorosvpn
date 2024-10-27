/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@africa-south"]
/ipv6 firewall address-list
add address=2600:1900:8000::/44 disabled=no list=route-gcp@africa-south
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-east"]
/ipv6 firewall address-list
add address=2600:1900:41a0::/44 disabled=no list=route-gcp@asia-east
add address=2600:1900:4030::/44 disabled=no list=route-gcp@asia-east
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-northeast"]
/ipv6 firewall address-list
add address=2600:1900:41d0::/44 disabled=no list=route-gcp@asia-northeast
add address=2600:1900:4050::/44 disabled=no list=route-gcp@asia-northeast
add address=2600:1901:8180::/44 disabled=no list=route-gcp@asia-northeast
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-south"]
/ipv6 firewall address-list
add address=2600:1900:40a0::/44 disabled=no list=route-gcp@asia-south
add address=2600:1900:41b0::/44 disabled=no list=route-gcp@asia-south
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@asia-southeast"]
/ipv6 firewall address-list
add address=2600:1900:4080::/44 disabled=no list=route-gcp@asia-southeast
add address=2600:1901:8170::/44 disabled=no list=route-gcp@asia-southeast
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@australia-southeast"]
/ipv6 firewall address-list
add address=2600:1900:40b0::/44 disabled=no list=route-gcp@australia-southeast
add address=2600:1900:41c0::/44 disabled=no list=route-gcp@australia-southeast
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-central"]
/ipv6 firewall address-list
add address=2600:1900:4140::/44 disabled=no list=route-gcp@europe-central
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-north"]
/ipv6 firewall address-list
add address=2600:1900:42a0::/44 disabled=no list=route-gcp@europe-north
add address=2600:1900:4150::/44 disabled=no list=route-gcp@europe-north
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-southwest"]
/ipv6 firewall address-list
add address=2600:1901:8100::/44 disabled=no list=route-gcp@europe-southwest
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@europe-west"]
/ipv6 firewall address-list
add address=2600:1900:40c0::/44 disabled=no list=route-gcp@europe-west
add address=2600:1900:40d0::/44 disabled=no list=route-gcp@europe-west
add address=2600:1900:4010::/44 disabled=no list=route-gcp@europe-west
add address=2600:1900:4060::/44 disabled=no list=route-gcp@europe-west
add address=2600:1900:4160::/44 disabled=no list=route-gcp@europe-west
add address=2600:1901:81b0::/44 disabled=no list=route-gcp@europe-west
add address=2600:1901:81f0::/44 disabled=no list=route-gcp@europe-west
add address=2600:1901:8110::/44 disabled=no list=route-gcp@europe-west
add address=2600:1901:8120::/44 disabled=no list=route-gcp@europe-west
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@global"]
/ipv6 firewall address-list
add address=2600:1901::/48 disabled=no list=route-gcp@global
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@me-central"]
/ipv6 firewall address-list
add address=2600:1900:5400::/44 disabled=no list=route-gcp@me-central
add address=2600:1901:81c0::/44 disabled=no list=route-gcp@me-central
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@me-west"]
/ipv6 firewall address-list
add address=2600:1901:8160::/44 disabled=no list=route-gcp@me-west
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@northamerica-northeast"]
/ipv6 firewall address-list
add address=2600:1900:40e0::/44 disabled=no list=route-gcp@northamerica-northeast
add address=2600:1900:41e0::/44 disabled=no list=route-gcp@northamerica-northeast
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@northamerica-south"]
/ipv6 firewall address-list
add address=2600:1900:4290::/44 disabled=no list=route-gcp@northamerica-south
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@southamerica-east"]
/ipv6 firewall address-list
add address=2600:1900:40f0::/44 disabled=no list=route-gcp@southamerica-east
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@southamerica-west"]
/ipv6 firewall address-list
add address=2600:1901:4010::/44 disabled=no list=route-gcp@southamerica-west
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-central"]
/ipv6 firewall address-list
add address=2600:1900:4000::/44 disabled=no list=route-gcp@us-central
add address=2600:1900:4070::/44 disabled=no list=route-gcp@us-central
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-east"]
/ipv6 firewall address-list
add address=2600:1900:4020::/44 disabled=no list=route-gcp@us-east
add address=2600:1900:4090::/44 disabled=no list=route-gcp@us-east
add address=2600:1901:8130::/44 disabled=no list=route-gcp@us-east
add address=2600:1901:8150::/44 disabled=no list=route-gcp@us-east
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-south"]
/ipv6 firewall address-list
add address=2600:1901:8140::/44 disabled=no list=route-gcp@us-south
/ipv6 firewall address-list remove [/ipv6 firewall address-list find list="route-gcp@us-west"]
/ipv6 firewall address-list
add address=2600:1900:4040::/44 disabled=no list=route-gcp@us-west
add address=2600:1900:4120::/44 disabled=no list=route-gcp@us-west
add address=2600:1900:4170::/44 disabled=no list=route-gcp@us-west
add address=2600:1900:4180::/44 disabled=no list=route-gcp@us-west
add address=2600:1900:4280::/44 disabled=no list=route-gcp@us-west
