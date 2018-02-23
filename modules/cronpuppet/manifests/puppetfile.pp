class cronpuppet::puppetfile {
    cron { 'r10k-puppetfile':
        ensure  => present,
        command => "[ -f /etc/puppetlabs/code/Puppetfile ] && cd /etc/puppetlabs/code && /opt/puppetlabs/bin/r10k puppetfile install",
        user    => root,
        minute  => [3, 13, 33, 43, 53],
    }
}
