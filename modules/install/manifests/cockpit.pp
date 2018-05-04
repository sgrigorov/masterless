# install Cockpit


class install::cockpit {
  notify {"Message from Cockpit Install":}
  case $facts['osfamily'] {
    'RedHat': {
        notify {"Message from Cockpit Install - RedHat":}
        package { "cockpit":    ensure   => present, }
     }
    'Debian': {
        notify {"Message from Cockpit Install - Debian":}
    }
}
