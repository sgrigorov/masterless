class install::fedora::fedorarpmfusion {

  $osrelease = $facts['os']['release']['full']
  
  # Install Fedora free Rpmfusion
  package { "fedora-rpmfusion-free":
    name      => "rpmfusion-free-release-$osrelease.noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$osrelease.noarch.rpm",
  }

  # Install Fedora fnonree Rpmfusion
  package { "fedora-rpmfusion-nonfree":
    name      => "rpmfusion-nonfree-release-$osrelease.noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$osrelease.noarch.rpm",
  }
}

# RedHat and Centos - http://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
# RedHat and Centos - http://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

# Class: gnometools
# Installs Gnome Tools
#
class install::fedora::gnometools {
  # Gnome Tweak Tool
  package { "gnome-tweak-tool": ensure => present, }
  package { "dconf":            ensure => present, }
  package { "vlc-core":         ensure => present, }
}
