:log info "start download route-valve.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/sites/valve/route-valve.rsc
:log info "route-valve.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-valve.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-valve.rsc
    :log info "route-valve.rsc address list updated!"
  }
}