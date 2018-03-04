
# Class: ssh-server
# Installs ssh-server
#
class install::sshserver {
  package { "openssh-server":  ensure => present, }
  case $facts['osfamily'] {
    'RedHat': {
        notify {"RedHat sshd":}
        service { 'sshd':
        ensure    => running,
        enable    => true,
      }
    }
    'Debian': {
        notify {"Debian ssh":}
        service { 'ssh':
        provider => 'systemd',
        ensure    => running,
        enable    => true,
        }
    }
  }
}
