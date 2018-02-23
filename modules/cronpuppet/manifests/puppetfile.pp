class cronpuppet::puppetfile {
    cron { 'r10k-puppetfile':
        ensure  => present,
        command => "$ [ -f /etc/puppetlabs/code/environments/production/Puppetfile ] && [cd /etc/puppetlabs/code/environments/production] && [/opt/puppetlabs/bin/r10k puppetfile install]"
        user    => root,
        minute  => [1, 11, 31, 41, 51],
    }
}
