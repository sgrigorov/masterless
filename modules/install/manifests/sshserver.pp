
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
        ensure    => running,
        enable    => true,
        }
    }
  }
}
