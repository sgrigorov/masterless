# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
class install::nomachine {
  package { 'NoMachine':
    ensure   => 'installed',
    provider => 'rpm',
    source   => "hhttp://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm"
  }
}
