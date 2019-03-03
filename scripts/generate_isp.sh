
# China Telecom
WHOIS3="docker run -i --rm zealic/whois3"



make_routes() {
  local source=$1
  ${WHOIS3} -h whois.apnic.net -l -i mb $source \
    | grep 'inetnum' | sed 's/inetnum:        //g' \
    | awk '{ print $1 $2 $3}' \
    | xargs -I {} sh -c "ipcalc {} | tail -n +2"
}

# 电信
make_routes MAINT-CHINANET > china-telecom-routes.txt
# 移动
make_routes MAINT-CN-CMCC > china-cmcc-routes.txt
# 联通
make_routes MAINT-CNCGROUP > china-cnc-routes.txt
# 铁通
make_routes MAINT-CN-CRTC  > china-crtc-routes.txt
# 教育网
make_routes MAINT-CERNET-AP > china-cernet-routes.txt
# CNNIC
make_routes MAINT-CNNIC-AP > china-cnnic-routes.txt
