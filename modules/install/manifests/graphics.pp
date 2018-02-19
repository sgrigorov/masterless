
# Installs Media applications
#
class install::graphics {
  # MyPaint - similar to Microsoft Windows Paint
  package { "mypaint":  ensure => present, }
  # GIMP
  package { "gimp":     ensure => present, }
}
