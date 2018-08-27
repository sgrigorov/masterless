# Class: tools
# Installs Tools
#
class install::tools {
  # Unzip
  package { "unzip":            ensure => present, }
  package { "vim":              ensure => present, }
  package { "vim-powerline":    ensure => present, }
  #add config for vimrc
  package { "tilix":            ensure => present, }
  package { "powerline":        ensure => present, }
  package { "powerline-fonts":  ensure => present, }
  # add config for bashrc
  # https://fedoramagazine.org/add-power-terminal-powerline/
  #policycoreutils - core utilities for SElinux - RedHat osfamily
  package { "policycoreutils":  ensure => present, }
}
