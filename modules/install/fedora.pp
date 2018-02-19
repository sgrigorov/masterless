class fedorarpmfsion {

  # Install Fedora free Rpmfusion
  package { "rpmfusion-free-release-$facts['os']['release']['full'].noarch":
    provider => 'rpm',
    ensure => present,
    source => "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$facts['os']['release']['full'].noarch.rpm",
  }

  # Install Fedora fnonree Rpmfusion
  package { "rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch":
    provider => 'rpm',
    ensure => present,
    source => "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch.rpm",
  }
}

# RedHat and Centos - http://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
# RedHat and Centos - http://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

# Class: gnometools
# Installs Gnome Tools
#
class gnometools {
  # Gnome Tweak Tool
  package { "gnome-tweak-tool"
    ensure => present,
  }
}
