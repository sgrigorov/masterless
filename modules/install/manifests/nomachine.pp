# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
class install::nomachine {
  case $facts['osfamily'] {
    'RedHat': {
      package { 'NoMachine':
      name     => 'nomachine_6.0.78_1_x86_64',
      ensure   => 'present',
      provider => 'rpm',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm"
      }
    }
    'Debian': {
      package { 'NoMachine':
      name     => 'nomachine_6.0.78_1_x86_64',
      ensure   => 'present',
      provider => 'dpkg',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.deb"
      }
    }
  }
}
