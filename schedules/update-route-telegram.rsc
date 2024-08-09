:log info "start download route-telegram.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/sites/telegram/route-telegram.rsc
:log info "route-telegram.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-telegram.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-telegram.rsc
    :log info "route-telegram.rsc address list updated!"
  }
}