class install::rpmfusion {
    $osid = $facts['os']['distro']['id']
    $osrelease = $facts['os']['release']['full']
    notify {"Message from rpmfusion Install":}
    case $osid {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora', 'Chapeau': {
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
    }
}
