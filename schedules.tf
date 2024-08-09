#==========================================================
# chnroutes
#==========================================================
resource "routeros_system_scheduler" "schedule_update-chnroutes" {
  name     = "schedule_update-chnroutes"
  on_event = file("schedules/update-chnroutes.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "08:00:00"
  interval   = "2w"
}

resource "routeros_system_scheduler" "schedule_update-chnroutes-ipv6" {
  name     = "schedule_update-chnroutes.ipv6"
  on_event = file("schedules/update-chnroutes.ipv6.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "08:10:00"
  interval   = "2w"
}

#==========================================================
# Cloud Service Providers
#==========================================================
resource "routeros_system_scheduler" "schedule_update-route-aws" {
  name     = "schedule_update-route-aws"
  on_event = file("schedules/update-route-aws.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "06:00:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-aws-cn" {
  name     = "schedule_update-route-aws@cn"
  on_event = file("schedules/update-route-aws@cn.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "06:00:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-azure" {
  name     = "schedule_update-route-azure"
  on_event = file("schedules/update-route-azure.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "06:10:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-gcp" {
  name     = "schedule_update-route-gcp"
  on_event = file("schedules/update-route-gcp.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "06:20:00"
  interval   = "4w"
}

#==========================================================
# Sites
#==========================================================
resource "routeros_system_scheduler" "schedule_update-route-cloudflare" {
  name     = "schedule_update-route-cloudflare"
  on_event = file("schedules/update-route-cloudflare.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "07:00:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-github" {
  name     = "schedule_update-route-github"
  on_event = file("schedules/update-route-github.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "07:10:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-mikrotik" {
  name     = "schedule_update-route-mikrotik"
  on_event = file("schedules/update-route-mikrotik.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "07:20:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-telegram" {
  name     = "schedule_update-route-telegram"
  on_event = file("schedules/update-route-telegram.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "07:30:00"
  interval   = "4w"
}

resource "routeros_system_scheduler" "schedule_update-route-valve" {
  name     = "schedule_update-route-valve"
  on_event = file("schedules/update-route-valve.rsc")
  policy   = ["read", "write", "policy", "test"]

  start_date = "1970-01-01"
  start_time = "07:40:00"
  interval   = "4w"
}
