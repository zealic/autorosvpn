:log info "start download route-aws.rsc ..."
/tool fetch http-method=get url=https://raw.githubusercontent.com/zealic/autorosvpn/master/cloud/aws/route-aws.rsc
:log info "route-aws.rsc downloaded."
:delay 5s
/file {
  :local addrFile
  :local fileSize
  :set addrFile [find where name="route-aws.rsc"]
  :set fileSize [get $addrFile size]
  :if ($fileSize > 32) do={
    /import file=route-aws.rsc
    :log info "route-aws.rsc address list updated!"
  }
}