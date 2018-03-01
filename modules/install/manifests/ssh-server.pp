
# Class: ssh-server
# Installs ssh-server
#
class install::ssh-server {
  package { "openssh-server":  ensure => present, }
}
