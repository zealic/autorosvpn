:log info "start download chnroutes.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/chnroutes.rsc
:log info "chnroutes.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="chnroutes.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 300000) do={
    /import file=chnroutes.rsc
    :log info "chnroutes address list updated!"
  }
}