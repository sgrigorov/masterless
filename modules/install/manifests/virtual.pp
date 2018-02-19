# Class: virtual
# Installs Virtual Tools
#
class install::virtual {
  # VirtualBox
  package { "VirtualBox": ensure => present, }
  package { "vagrant": ensure => present, }
}
