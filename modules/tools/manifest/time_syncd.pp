#ensure service is enabled and running

service { 'systemd-timesyncd':
        provider => 'systemd',
        ensure    => running,
        enable    => true,
        }
