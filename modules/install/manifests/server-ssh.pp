
# Class: ssh-server
# Installs ssh-server
#
class install::server-ssh {
  package { "openssh-server":  ensure => present, }
}
