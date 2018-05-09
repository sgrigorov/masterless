# Install Synergy


class install::synergy {
  notify {"Message from Synergy Install":}
  case $facts['osfamily'] {
    'RedHat': {
        package { "synergy":    ensure  => present, }
        # Open port 8080
        # firewall-cmd --permanent --add-port=8080/tcp
        #service { "cockpit":
        #    ensure    => running,
        #    enable    => true,
        #}
      }
    'Debian': {
    }
  }
}
