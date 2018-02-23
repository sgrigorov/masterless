class cronpuppet::puppetfile {
    file { '/etc/puppetlabs/code/Puppetfile':
        source    => '/etc/puppetlabs/code/environments/production/files/Puppetfile',
        replace   => false,
    }
#   exec { 'cronpuppet_puppetfile':
#   command => "cp /etc/puppetlabs/code/environments/production/files/Puppetfile /etc/puppetlabs/code/Puppetfile", # Double quotes for Variable interpolation
#   path   => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:",
#   unless => 'test -e /etc/puppetlabs/code/Puppetfile',
#   }
    cron { 'r10k-puppetfile':
        ensure  => present,
        command => "[ -f /etc/puppetlabs/code/Puppetfile ] && cd /etc/puppetlabs/code && /opt/puppetlabs/bin/r10k puppetfile install",
        user    => root,
        minute  => [3, 13, 33, 43, 53],
    }
}
