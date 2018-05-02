class install::rpmfusion {
    notify {"Message from rpmfusion Install":}
    notify {"Message from rpmfusion Install - " $facts['os']['id']:}
    case $facts['os']['id'] {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }
    }
}
