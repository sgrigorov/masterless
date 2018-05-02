class install::rpmfusion {
    notify {"Message from rpmfusion Install":}
    case $facts['osid'] {
      'CentOS': {
          notify {"Message from rpmfusion Install - CentOS":}
      }
      'Fedora|Chapeau': {
            notify {"Message from rpmfusion Install - Fedora":}
      }

