class examplerpm ( $src ) {

  package { 'rpmfusion-free-release-$facts['os']['release']['full'].noarch':
     provider => 'rpm',
     ensure => present,
     source => "${fusionfree::src}",
 }
}

class { 'fusionfree':
  src => "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$facts['os']['release']['full'].noarch.rpm",
}
