:log info "start download route-aws@cn.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/cloud/aws/route-aws@cn.rsc
:log info "route-aws@cn.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-aws@cn.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-aws@cn.rsc
    :log info "route-aws@cn.rsc address list updated!"
  }
}