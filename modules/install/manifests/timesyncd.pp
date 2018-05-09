# Class: timesync
# Installs timesync
#
class install::timesyncd {
  case $facts['os']['name'] {
    'RedHat', 'CentOS', 'Debian': {
      package { "chrony":  ensure => present, }
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
      case $facts['os']['release']['full'] {
        '28': {
            package { "chrony":  ensure => present, }
            service { 'ntpd':
              ensure    => stopped,
              enable    => false,
            }
            service { 'chronyd':
              ensure    => running,
              enable    => true,
            }
        }
        default: {
            service { 'systemd-timesyncd':
              provider => 'systemd',
              ensure    => running,
              enable    => true,
            }
        }
    }
  }
}
