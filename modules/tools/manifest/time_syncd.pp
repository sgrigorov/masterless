#ensure service is enabled and running
if $facts['ntpd'] == 'LoadState=not-found' {
  notify { "ntpd not found": }
  if $facts['systemd-timesyncd'] == 'LoadState=loaded' {
    notify { "systemd-timesyncd found": }
  }
  notify { "time sync not found": }
} else {
  notify { "ntpd found": }
  if $facts['systemd-timesyncd'] == 'LoadState=loaded' {
    notify { "systemd-timesyncd not found": }
  }
}
#service { 'systemd-timesyncd':
#        provider => 'systemd',
#        ensure    => running,
#        enable    => true,
#        }
