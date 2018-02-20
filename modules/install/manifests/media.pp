# Installs Media applications
#
class install::media {
  # VLC
  package { "vlc-core": ensure => present, }
  package { "kodi":     ensure => present, }
}
