class cronpuppet {
    cron { 'r10k-deploy':
        ensure  => present,
        command => "r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml",
        environment => [ 'PATH="/opt/puppetlabs/bin/"' ],
        #path    => '/opt/puppetlabs/bin/:/bin/:/sbin/:/usr/bin/:/usr/sbin/',
        user    => root,
        minute  => [1, 31],
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        environment => [ 'PATH="/opt/puppetlabs/bin/"' ],
        user    => root,
        minute  => [5, 35],
    }
    cron { 'puppet-apply2':
        ensure  => present,
        command => "puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        environment => [ 'PATH="/opt/puppetlabs/bin/"' ],
        user    => root,
        minute  => [15, 45],
    }    
    
    
    
    
    
    
    
}
