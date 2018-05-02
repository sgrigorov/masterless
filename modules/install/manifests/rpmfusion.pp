class install::rpmfusion {
    $osid = $facts['os']['id']
    notify {"Message from rpmfusion Install $osid":}
    case $facts['os']['id'] {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }
    }
}
