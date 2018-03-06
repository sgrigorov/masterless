#ensure service is enabled and running
if $facts['nomachine_installed'] {
notify "systemd-timesyncd exist"
} else {
notify "systemd-timesyncd does not exist"
}
#service { 'systemd-timesyncd':
#        provider => 'systemd',
#        ensure    => running,
#        enable    => true,
#        }
