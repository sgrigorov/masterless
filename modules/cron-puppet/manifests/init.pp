class cron-puppet {
    cron { 'r10k-deploy':
        ensure  => present,
        command => "r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml",
        user    => root,
        minute  => [1, 31],
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        user    => root,
        minute  => [5, 35],
    }
    
    
    
    
    
    
    
    
}
