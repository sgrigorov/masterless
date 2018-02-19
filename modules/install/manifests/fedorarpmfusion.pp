class install::fedorarpmfusion {

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
