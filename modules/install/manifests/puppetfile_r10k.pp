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
class install::puppetfile_r10k {
  file { '/etc/puppetlabs/code/Puppetfile':
      source    => '/etc/puppetlabs/code/environments/production/files/Puppetfile',
      replace   => false,
    }
  if [ -f /etc/puppetlabs/code/Puppetfile ] {
    exec
    
    }
