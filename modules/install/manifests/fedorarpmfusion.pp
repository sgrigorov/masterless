class install::fedorarpmfusion {

  # Install Fedora free Rpmfusion
  package { "fedora-rpmfusion-free":
    name      => "rpmfusion-free-release-$facts['os']['release']['full'].noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$facts['os']['release']['full'].noarch.rpm",
  }

  # Install Fedora fnonree Rpmfusion
  package { "fedora-rpmfusion-nonfree":
    name      => "rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch",
    provider  => 'rpm',
    ensure    => present,
    source    => "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$facts['os']['release']['full'].noarch.rpm",
  }
}
