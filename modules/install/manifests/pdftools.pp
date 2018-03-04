# Class: pdftools
# Installs Master PDF Editor
#
class install::pdftools {
  # Master PDF Editor
  $version = '4.3.82'
  $version_installed = $facts['nomachine_installed']
  if $facts['masterpdfeditor_installed'] {
      notify {"master-pdf-editor is already installed":}
    } else {
      package { "qt5-qtsvg": ensure => present, }
      case $facts['osfamily'] {
        'RedHat': {
          package { "master-pdf-fedora":
            name      => "master-pdf-editor-${version}_qt5",
            provider  => 'rpm',
            ensure    => present,
            source    => "http://get.code-industry.net/public/master-pdf-editor-${version}_qt5.x86_64.rpm",
            require   => Package['qt5-qtsvg'],
          }
        }
        'Debian': {
            file { 'master-pdf-fedora.deb':
              path   => "/tmp/master-pdf-editor-${version}_qt5.amd64.deb",
              source => [  "http://get.code-industry.net/public/master-pdf-editor-${version}_qt5.amd64.deb",  ],
            }
            package { 'master-pdf-fedora':
              name     => "master-pdf-editor-${version}_qt5",
              provider => 'dpkg',
              ensure   => 'present',
              source   => "/tmp/master-pdf-editor-${version}_qt5.amd64.deb",
              require   => Package['qt5-qtsvg'],
            }
          }
        }
      }
}

