# install Cockpit


class install::cockpit {
  notify {"Message from Cockpit Install":}
  case $facts['osfamily'] {
    'RedHat': {
        package { "cockpit": ensure   => present, }
     }
    'Debian': {
    }
}
