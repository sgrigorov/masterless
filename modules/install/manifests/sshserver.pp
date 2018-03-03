
# Class: ssh-server
# Installs ssh-server
#
class install::sshserver {
  package { "openssh-server":  ensure => present, }
  service { 'sshd':
    ensure    => running,
    enable    => true,
  }
}
