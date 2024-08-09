:log info "start download chnroutes.ipv6.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/chnroutes.ipv6.rsc
:log info "chnroutes.ipv6.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="chnroutes.ipv6.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 100000) do={
    /import file=chnroutes.ipv6.rsc
    :log info "chnroutes ipv6 address list updated!"
  }
}