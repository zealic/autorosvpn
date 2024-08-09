:log info "start download route-gcp.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/cloud/gcp/route-gcp.rsc
:log info "route-gcp.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-gcp.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-gcp.rsc
    :log info "route-gcp.rsc address list updated!"
  }
}