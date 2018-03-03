# http://download.nomachine.com/download/6.0/Linux/nomachine_6.0.78_1_x86_64.rpm

# Installs Media applications
#
class install::nomachine {
  # MyPaint - similar to Microsoft Windows Paint
  package { "mypaint":  ensure => present, }
  # GIMP
  package { "gimp":     ensure => present, }
}
