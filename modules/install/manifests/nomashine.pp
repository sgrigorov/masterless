# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
class install::nomachine {
  case Facter.value(:osfamily)
    when "RedHat" then
      package { 'NoMachine':
      ensure   => 'installed',
      provider => 'rpm',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm"
      }
    end
    when "Debian" then
      package { 'NoMachine':
      ensure   => 'installed',
      provider => 'dpkg',
      source   => "http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.deb"
      }
    end
  end
}
