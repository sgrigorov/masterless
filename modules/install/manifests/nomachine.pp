# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
#class install::nomachine {
class install::nomachine (
  $version = '6.0.78_1_x86_64',
)
  case $facts['osfamily'] {
    'RedHat': {
      # if nomachine is not installed
      package { 'NoMachine':
      name     => 'nomachine_6.0.78_1_x86_64',
      ensure   => 'present',
      provider => 'rpm',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_${version}.rpm"
      }
      # endif
    }
    'Debian': {
      # if nomachine is not installed
      package { 'NoMachine':
      name     => 'nomachine_6.0.78_1_x86_64',
      ensure   => 'present',
      provider => 'dpkg',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_${version}.deb"
      }
      # enfif
    }
  }
}
