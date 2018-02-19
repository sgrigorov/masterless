# RedHat and Centos - http://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
# RedHat and Centos - http://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
class install::centosrpmfusion {

  # Install CentOS free Rpmfusion
  package { "rpmfusion-free-release-$facts['os']['release']['full'].noarch":
    provider => 'rpm',
    ensure => present,
    source => "https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$facts['os']['release']['full'].noarch.rpm",
  }

  # Install CentOS nonfree Rpmfusion
  package { "rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch":
    provider => 'rpm',
    ensure => present,
    source => "https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch.rpm",
  }
}
