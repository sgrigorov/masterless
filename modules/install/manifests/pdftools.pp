# Class: pdftools
# Installs Master PDF Editor
#
class install::pdftools {
  $osrelease = $facts['os']['release']['full']
  $osname = $facts['os']['name']
  # Master PDF Editor
  # if fedora
  package { "master-pdf-fedora":
    name      => "master-pdf-editor-4.3.82_qt5.x86_64",
    provider  => 'rpm',
    ensure    => present,
    source    => "http://get.code-industry.net/public/master-pdf-editor-4.3.82_qt5.x86_64.rpm",
  }
}

