
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
make_routes MAINT-CHINANET > chnroutes-chinanet.txt
# 移动
make_routes MAINT-CN-CMCC > chnroutes-cmcc.txt
# 联通
make_routes MAINT-CNCGROUP > chnroutes-cnc.txt
# 铁通
make_routes MAINT-CN-CRTC  > chnroutes-crtc.txt
# 教育网
make_routes MAINT-CERNET-AP > chnroutes-cernet.txt
# CNNIC
make_routes MAINT-CNNIC-AP > chnroutes-cnnic.txt
