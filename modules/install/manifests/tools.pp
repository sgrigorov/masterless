# Class: tools
# Installs Tools
#
class install::tools {
  # Unzip
  package { "unzip":  ensure => present, }
}
