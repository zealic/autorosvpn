# autorosvpn
Route address list for RouterOS, include:
- chnroutes
- Well-known Cloud Providers
- Well-known Sites or App/Company
- China ISP Maintanced routes

## Usage

### example import script
Router OS only import script:

```shell
:log info "start download address-list.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/address-list.rsc
:log info "address-list.rsc downloaded."
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="address-list.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 300000) do={
    /import file=address-list.rsc
    :log info "NoVPN address list updated!"
  }
}
```

### Route - Cloud Service Providers

* [aws](https://github.com/zealic/autorosvpn/tree/master/cloud/aws)  
  [Amazon Web Services](https://aws.amazon.com/cn/) Routes
* [azure](https://github.com/zealic/autorosvpn/tree/master/cloud/azure)  
  [Microsoft Azure](https://azure.microsoft.com/) Routes
* [gcp](https://github.com/zealic/autorosvpn/tree/master/cloud/gcp)  
  [Google Cloud Platform](https://cloud.google.com/) Routes

### Route - Sites

* [route-cloudflare](https://github.com/zealic/autorosvpn/tree/master/sites/cloudflare)  
  [Cloudflare CDN Provider](https://cloudflare.com)
* [route-github](https://github.com/zealic/autorosvpn/tree/master/sites/github)  
  [Github](https://github.com)
* [route-mikrotik](https://github.com/zealic/autorosvpn/tree/master/sites/mikrotik)  
  [Mikrotik](https://mikrotik.com)
* [route-telegram](https://github.com/zealic/autorosvpn/tree/master/sites/telegram)  
  [Telegram](https://telegram.org)
* [route-valve](https://github.com/zealic/autorosvpn/tree/master/sites/valve)  
  [Valve Software](https://valvesoftware.com) and [Steam Store](https://sotre.steampowered.com)

### Route - chnroutes
中国路由表

* [chnroutes](https://github.com/zealic/autorosvpn/tree/master/chnroutes.rsc) [chnroutes.ipv6](https://github.com/zealic/autorosvpn/blob/master/chnroutes.ipv6.rsc)  
  中国路由表，包括所有中国的 IP 段，相较下面的 ISP 路由，其更新速度和时效性不如下方的 ISP 路由，所以偶尔会有些许疏漏。
* [address-list (novpn)](https://github.com/zealic/autorosvpn/tree/master/address-list.rsc)  
  中国路由表，同时包含局域网地址，方便统一做路由策略规则。

### Route - Maintance by [ISP](https://en.wikipedia.org/wiki/Internet_service_provider)
* [route-isp-cernet-ap](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-cernet-ap.rsc)  
  中国教育网（CERNET: China Education and Research Network）路由表
* [route-isp-chinanet](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-chinanet.rsc)  
  中国电信（CHINANET: China Telecom）路由表
* [route-isp-cn-cmcc](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-cn-cmcc.rsc)  
  中国移动（CMCC: China Mobile Communications Group）路由表
* [route-isp-cncgroup](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-cncgroup.rsc)  
  中国联通（CNC: China Unicom Group）路由表
* [route-isp-cnnic-ap](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-cnnic-ap.rsc)  
  中国互联网信息中心（CNNIC: China Internet Network Information Center）路由表
* [route-isp-cn-crtc](https://github.com/zealic/autorosvpn/tree/master/isp/cn/route-isp-cn-crtc.rsc)  
  中国铁通（China Railway Telecommunications Center）路由表

## Automatic update schedule
You can RouterOS schedule to auto update address list.

Use the [Terraform RouterOS](https://registry.terraform.io/providers/terraform-routeros/routeros/latest/docs) orchestration I have already written [schedules.tf](./schedules.tf) to import the scheduled tasks.

### TODO
Parse routes from:

* https://bgp.he.net/country/CN
* https://ftp.arin.net/pub/rr/arin.db
* https://ftp.arin.net/pub/stats/

## Donate

Bitcoin: [`18mXNJyHdUSKfvQSrXCdQsuStp6eWFUVnh`][donate-url]

[![Donate Bitcoin][donate-image]][donate-url]

## License
[MIT](./LICENSE)

## References
- https://ripe.net
- https://bgp.he.net
- https://ipinfo.io
- https://bgpview.io

[donate-image]:   https://github.com/zealic/vanitygen-hd/blob/master/donate.png
[donate-url]:     https://www.blockchain.com/btc/address/18mXNJyHdUSKfvQSrXCdQsuStp6eWFUVnh
