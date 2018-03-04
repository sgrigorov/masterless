
# Class: ssh-server
# Installs ssh-server
#
class install::sshserver {
  package { "openssh-server":  ensure => present, }
  case $facts['osfamily'] {
    'RedHat': {
        service { 'sshd':
        ensure    => running,
        enable    => true,
      }
    }
    'Debian': {
        service { 'ssh':
        ensure    => running,
        enable    => true,
        }
    }
  }
}
