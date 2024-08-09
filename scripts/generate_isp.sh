#!/usr/bin/env bash
source $(dirname "$0")/common.sh
WHOIS_HOST=whois.apnic.net
WHOIS3="docker run -i --rm zealic/whois3 -h $WHOIS_HOST"

prepare_route_by_id(){
  local id=$1
  local iplist=$2
  ${WHOIS3} -l -i mb $id \
    | grep 'inetnum' | sed 's/inetnum:        //g' \
    | awk '{ print $1 $2 $3}' \
    | xargs -I {} sh -c "ipcalc -d {} | grep Network: | awk '{ print \$2}'" > $iplist
}

generate(){
  local country=$1
  local id=$2
  local name=`echo $id | sed -e "s/^MAINT-//" | tr '[:upper:]' '[:lower:]'`
  local fullname=route-isp-$name
  local iplist=${fullname}_ips.list

  echo Generating $fullname routes...
  if [[ -d isp/$country/$fullname ]]; then
    rm -r isp/$country/$fullname
  fi
  mkdir -p isp/$country

  pushd isp/$country > /dev/null
  prepare_route_by_id $id $iplist

  cat $iplist | sort -t . -n | trim_ipv6 | write_rsc ${fullname} > ${fullname}.rsc
  #cat $iplist | sort -t : -n | only_ipv6 | write_rsc_ipv6 ${fullname} > ${fullname}.ipv6.rsc
  cat $iplist | sort -t . -n | trim_ipv6 | write_txt ${fullname} > ${fullname}.txt
  #cat $iplist | sort -t : -n | only_ipv6 | write_txt ${fullname} > ${fullname}.ipv6.txt
  rm $iplist
  popd > /dev/null
}

# 电信
generate cn MAINT-CHINANET
# 移动
generate cn MAINT-CN-CMCC
# 联通
generate cn MAINT-CNCGROUP
# 铁通
generate cn MAINT-CN-CRTC
# 教育网
generate cn MAINT-CERNET-AP
# CNNIC
generate cn MAINT-CNNIC-AP
