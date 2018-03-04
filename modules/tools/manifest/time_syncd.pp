#ensure service is enabled and running
if [ -f /usr/lib/systemd/systemd-timesyncd ] {
notify "systemd-timesyncd exist"
} else {
notify "systemd-timesyncd does not exist"
}
#service { 'systemd-timesyncd':
#        provider => 'systemd',
#        ensure    => running,
#        enable    => true,
#        }
