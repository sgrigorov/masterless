class install::rpmfusion {
    $osid = $facts['os']['distro']['id']
    notify {"Message from rpmfusion Install":}
    #notify {"M"$osid:}
    case $osid {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }
    }
}
