#enable partners repository
#enable source repositories
class install::sources_list {
    $osid = $facts['os']['distro']['id']
    #$osrelease = $facts['os']['release']['full']
    notify {"Message from sources_list Install":}
    case $osid {
      'Debian': {
            # Install CentOS free Rpmfusion
      }
      'Ubuntu': {
            # Install Fedora free Rpmfusion
      }
    }
}
