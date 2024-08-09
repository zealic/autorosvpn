# autorosvpn
China Routes and Cloud Service Provider Routes.

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
- https://bgp.he.net

[donate-image]:   https://github.com/zealic/vanitygen-hd/blob/master/donate.png
[donate-url]:     https://www.blockchain.com/btc/address/18mXNJyHdUSKfvQSrXCdQsuStp6eWFUVnh
