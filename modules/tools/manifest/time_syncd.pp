#ensure service is enabled and running
if $facts['ntpd'] == 'LoadState=not-found' {
notify "ntpd not found"
} else {
notify "ntpd found"
}
#service { 'systemd-timesyncd':
#        provider => 'systemd',
#        ensure    => running,
#        enable    => true,
#        }
