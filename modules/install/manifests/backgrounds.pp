# dnf install f28-backgrounds-extras-gnome

class install::backgrounds {
    $osid = $facts['os']['distro']['id']
    $osrelease = $facts['os']['release']['full']
    
    # if gnome is installed
    
    notify {"Message from backgrounds Install":}
    case $osid {
      'CentOS': {
            # Install CentOS backgrounds
            }
      }
      'Fedora', 'Chapeau': {
            # Install Fedora backgrounds-extras-gnome
            package { "backgrounds-extras-gnome":
                name      => "f$osrelease-backgrounds-extras-gnome.noarch",
                ensure    => present,
            }
      }
    }
}
