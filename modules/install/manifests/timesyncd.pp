# Class: timesync
# Installs timesync
#
class install::timesyncd {
  case $facts['osname'] {
    'RedHat', 'CentOS', 'Debian': {
 #       notify {"RedHat sshd":}
      package { "chronyd":  ensure => present, }
      service { 'ntpd':
        ensure    => stopped,
        enable    => false,
      }
      service { 'chronyd':
        ensure    => running,
        enable    => true,
      }
    }
    'Fedora': {
#        notify {"Debian ssh":}
        service { 'ssh':
        provider => 'systemd',
        ensure    => running,
        enable    => true,
        }
    }
  }
}
