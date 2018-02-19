# RedHat and Centos - http://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
# RedHat and Centos - http://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
class install::centosrpmfusion {

  $osrelease = $facts['os']['release']['full']

  # Install CentOS free Rpmfusion
  package { "centos-rpmfusion-free":
    name      => "rpmfusion-free-release-$osrelease.noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$osrelease.noarch.rpm",
  }

  # Install CentOS nonfree Rpmfusion
  package { "centos-rpmfusion-nonfree":
    name      => "rpmfusion-nonfree-release-$osrelease.noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$osrelease.noarch.rpm",
  }
}
