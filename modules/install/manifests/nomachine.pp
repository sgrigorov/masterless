# Latest download URL http://download.nomachine.com/download/6.1/Linux/nomachine_6.1.6_9_amd64.deb

# Installs Media applications
#
class install::nomachine {
#class install::nomachine (
  $version = '6.1.6_9'
#)
  $version_installed = $facts['nomachine_installed']
  if $facts['nomachine_installed'] {
      notify {"Nomachine $version_installed is already installed":}
    } else {
      case $facts['osfamily'] {
        'RedHat': {
          package { 'NoMachine':
            name     => 'nomachine_${version}',
            ensure   => 'present',
            provider => 'rpm',
            source   => "http://download.nomachine.com/download/6.1/Linux/nomachine_${version}_x86_64.rpm"
          }
        }
        'Debian': {
        file { 'nomachine_amd64.deb':
            path   => "/tmp/nomachine_${version}_amd64.deb",
            source => [  "http://download.nomachine.com/download/6.1/Linux/nomachine_${version}_amd64.deb",  ],
          }
        package { 'NoMachine':
            name     => 'nomachine_${version}',
            ensure   => 'present',
            provider => 'dpkg',
            source   => "/tmp/nomachine_${version}_amd64.deb",
          }
        }
      }
    }
}
