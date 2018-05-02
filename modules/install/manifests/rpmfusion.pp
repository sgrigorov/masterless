class install::rpmfusion {
    notify {"Message from rpmfusion Install":},
    notify {$facts['os']['id']:}
    case $facts['os']['id'] {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }
    }
}
