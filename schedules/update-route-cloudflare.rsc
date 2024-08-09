:log info "start download route-cloudflare.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/sites/cloudflare/route-cloudflare.rsc
:log info "route-cloudflare.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-cloudflare.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-cloudflare.rsc
    :log info "route-cloudflare.rsc address list updated!"
  }
}