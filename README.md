# autorosvpn
China Route Tables

## Usage

### address-list.rsc
Router OS only import script:

```shell
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/address-list.rsc
:local addrFile
:local fileSize
/file
:set addrFile [find where name="address-list.rsc"]
:set fileSize [get $addrFile size]
:if ($fileSize > 300000) do={
  /import file=address-list.rsc
  :log "NoVPN address list updated!"
}
```

### chnroutes
中国路由表

* chnroutes  
  中国路由表
* chnroutes-cernet  
  中国教育网路由表
* chnroutes-chinanet  
  中国电信路由表
* chnroutes-cmcc  
  中国移动路由表
* chnroutes-cnc  
  中国联通路由表
* chnroutes-cnnic  
  中国CNNIC
* chnroutes-crtc  
  中国铁通路由表
