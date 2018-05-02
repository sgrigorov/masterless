class install::rpmfusion {
    $osid = $facts['os']['id']
    #notify {"Message from rpmfusion Install $osid":}
    notify {"M"$osid:}
    case $osid {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }
    }
}
