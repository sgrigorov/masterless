#ensure service is enabled and running
class tools::time_syncd {
  if $facts['ntpd'] != 'LoadState=loaded' {
    notify { "ntpd not found": }
    if $facts['systemd-timesyncd'] == 'LoadState=loaded' {
      notify { "systemd-timesyncd found": }
      service { 'systemd-timesyncd':
        provider => 'systemd',
        ensure    => stopped,
        enable    => true,
      }
    } else {
      notify { "time sync not found": }
    }
  } else {
    notify { "ntpd found": }
    if $facts['systemd-timesyncd'] != 'LoadState=loaded' {
      notify { "systemd-timesyncd not found": }
      service { 'ntpd':
        #provider => 'systemd',
        ensure    => stopped,
        enable    => true,
      }
    } else {
      notify { "too many time syncs": }
    }
  }
}
#service { 'systemd-timesyncd':
#        provider => 'systemd',
#        ensure    => running,
#        enable    => true,
#        }
