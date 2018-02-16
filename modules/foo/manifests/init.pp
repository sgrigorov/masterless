class foo {
  file {
    "/tmp/hello":
      ensure => file,
      source => "puppet:///modules/foo/hello";
  }
  #Where $module_stdlib is a module I whant to install. 
  #The /bin path is a path where the grep comes from. 
  #And the /opt/puppetlabs/bin is a path where for the puppet binary exists in my installation.
  $module_stdlib = 'puppetlabs-stdlib'
  exec { 'puppet_module_stdlib':
    command => "puppet module install ${module_stdlib}",
    unless  => "puppet module list | grep ${module_stdlib}",
    path    => ['/bin', '/opt/puppetlabs/bin'],
    user    => "root",
  }
}
