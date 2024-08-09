:log info "start download route-azure.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/cloud/azure/route-azure.rsc
:log info "route-azure.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-azure.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-azure.rsc
    :log info "route-azure.rsc address list updated!"
  }
}