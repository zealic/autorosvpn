:log info "start download route-mikrotik.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/sites/mikrotik/route-mikrotik.rsc
:log info "route-mikrotik.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-mikrotik.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-mikrotik.rsc
    :log info "route-mikrotik.rsc address list updated!"
  }
}