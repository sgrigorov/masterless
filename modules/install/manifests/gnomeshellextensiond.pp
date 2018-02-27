#https://github.com/brunelli/gnome-shell-extension-installer/blob/master/gnome-shell-extension-installer
#http://bernaerts.dyndns.org/linux/76-gnome/283-gnome-shell-install-extension-command-line-script
#http://bernaerts.dyndns.org/linux/76-gnome/345-gnome-shell-install-remove-extension-command-line-script

file { '/devops/RRDI-repo-Linux64-5.0.2GA.zip':
  source => 'puppet:///somemodule//devops/RRDI-repo-Linux64-5.0.2GA.zip'
  notify => Exec['unzip'],
}

file { '/tmp/RRDI_INSTALLATION/':
  ensure => 'directory',
  mode   => '1777',
  owner  => 'user',
  group  => 'user',
}

exec { 'unzip':
  command     => 'unzip /devops/RRDI-repo-Linux64-5.0.2GA.zip -d /tmp/RRDI_INSTALLATION/',
  cwd         => '/home/user/',
  user        => 'root',
  require     => File["/tmp/RRDI_INSTALLATION/"],
  refreshonly => true,
}
