#r10k puppetfile deploy
#class cronpuppet::puppetfile {
#    file { '/etc/puppetlabs/code/Puppetfile':
#        source    => '/etc/puppetlabs/code/environments/production/files/Puppetfile',
#        replace   => false,
#    }
#    cron { 'r10k-puppetfile':
#        ensure  => present,
#        command => "[ -f /etc/puppetlabs/code/Puppetfile ] && /opt/puppetlabs/bin/r10k puppetfile install --puppetfile=/etc/puppetlabs/code/Puppetfile",
#        user    => root,
#        minute  => [3, 13, 33, 43, 53],
#    }
#}
class install::puppetfile::r10k {
  notify {"Message from Puppetfile - r10k":}
  $pupetfile_str = "# Install puppetlabs-stdlib from the Forge
# !!!! Puppetfile doesn't install the dependencies
# !!!! Puppetfile installs only listed modules
moduledir '/etc/puppetlabs/code/modules'
mod 'puppetlabs/stdlib'

# Added modules
"
  file { '/etc/puppetlabs/code/Puppetfile':
      #source    => '/etc/puppetlabs/code/environments/production/files/Puppetfile',
      content => $pupetfile_str,
      replace   => false,
      notify    => Exec['r10k_puppetfile'],
    }
  exec { 'r10k_puppetfile':
      command     => '/opt/puppetlabs/bin/r10k puppetfile install --puppetfile=/etc/puppetlabs/code/Puppetfile',
      #cwd         => '/opt/puppetlabs/bin',
      #user        => 'root',
      require     => File['/etc/puppetlabs/code/Puppetfile'],
      subscribe   => File['/etc/puppetlabs/code/Puppetfile'],
      #refreshonly => true,
    }
}

#if [ -f /etc/puppetlabs/code/Puppetfile ] {
#  exec
#  
#  }
