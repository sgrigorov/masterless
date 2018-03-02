
# Class: ssh-server
# Installs ssh-server
#
class install::sshserver {
  package { "openssh-server":  ensure => present, }
}
