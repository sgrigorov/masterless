# Class: gnometools
# Installs Gnome Tools
#
class install::gnometools {
  # Gnome Tweak Tool
  package { "gnome-tweak-tool": ensure => present, }
  package { "dconf":            ensure => present, }
  package { "vlc-core":         ensure => present, }
}
