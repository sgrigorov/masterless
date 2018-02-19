
# Class: playonlinux
# Installs PlayOnLinux
#
class install::playonlinux {
  # PlayOnLinux
  package { "playonlinux": ensure => present, }
}
