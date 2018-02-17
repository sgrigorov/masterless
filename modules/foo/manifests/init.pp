class foo {
  file {
    "/tmp/hello":
      ensure => file,
      source => "puppet:///modules/foo/hello";
  }
  #Where $module_stdlib is a module I whant to install.
  #The /bin path is a path where the grep comes from.
  #And the /opt/puppetlabs/bin is a path where for the puppet binary exists in my installation.
  $module_stdlib = 'puppet-nginx'
  exec { 'puppet_module_nginx':
        #path    => [ '/opt/puppetlabs/bin/', '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
        path    => '/opt/puppetlabs/bin/:/bin/:/sbin/:/usr/bin/:/usr/sbin/',
        command => "puppet module install puppet-nginx",
        unless  => "puppet module list | grep puppet-nginx",
  }
}
