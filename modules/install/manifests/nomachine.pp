# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
class install::nomachine {
#class install::nomachine (
  $version = '6.0.78_1_x86_64'
#)
  if $facts['nomachine_installed'] {
      notify {"Nomachine ${version} is already installed":}
    } else {
      case $facts['osfamily'] {
        'RedHat': {
          package { 'NoMachine':
            name     => 'nomachine_${version}',
            ensure   => 'present',
            provider => 'rpm',
            source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_${version}.rpm"
          }
        }
        'Debian': {
          package { 'NoMachine':
            name     => 'nomachine_${version}',
            ensure   => 'present',
            provider => 'dpkg',
            source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_${version}.deb"
          }
        }
      }
    }
}
