class examplerpm ( $src ) {

  package { 'package':
     provider => 'rpm',
     ensure => installed,
     source => "${examplerpm::src}"
 }
}

class { 'examplerpm':
  src => 'https://example.com/package.rpm',
}
