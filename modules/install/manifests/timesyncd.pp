# Class: timesync
# Installs timesync
#
class install::timesyncd {
  case $facts['os']['name'] {
    'RedHat', 'CentOS', 'Debian': {
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
      service { 'systemd-timesyncd':
        provider => 'systemd',
        ensure    => running,
        enable    => true,
      }
    }
  }
}
