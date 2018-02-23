class cronpuppet::puppetfile {
    cron { 'r10k-puppetfile':
        ensure  => present,
        command => "[ -f /etc/puppetlabs/code/environments/production/Puppetfile ] && cd /etc/puppetlabs/code/environments/production && /opt/puppetlabs/bin/r10k puppetfile install",
        user    => root,
        minute  => [3, 13, 33, 43, 53],
    }
}
