# install Cockpit


class install::cockpit {
  notify {"Message from Cockpit Install":}
  case $facts['osfamily'] {
    'RedHat': {
        package { "cockpit":    ensure  => present, }
        # Open port 8080
        # firewall-cmd --permanent --add-port=8080/tcp
        service { "cockpit":
            ensure    => running,
            enable    => true,
        }
      }
    'Debian': {
    }
  }
}
