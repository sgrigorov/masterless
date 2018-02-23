class cronpuppet::puppetfile {
    if [ ! -f /etc/puppetlabs/code/Puppetfile ] {
    file { '/etc/puppetlabs/code/Puppetfile':
        source  => /etc/puppetfile/code/environment/production/files/Puppetfile,
    }
    }
    cron { 'r10k-puppetfile':
        ensure  => present,
        command => "[ -f /etc/puppetlabs/code/Puppetfile ] && cd /etc/puppetlabs/code && /opt/puppetlabs/bin/r10k puppetfile install",
        user    => root,
        minute  => [3, 13, 33, 43, 53],
    }
}
