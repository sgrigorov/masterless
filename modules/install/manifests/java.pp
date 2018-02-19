# Installs Java Tools
#
class install::java {
  package { "java-openjdk": ensure => present, }
  package { "icedtea-web":            ensure => present, }
}
