class cronpuppet {
    cron { 'r10k-deploy':
        ensure  => present,
        command => "/opt/puppetlabs/bin/r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml",
        environment => absent,
        #path    => absent,
        user    => root,
        minute  => [1, 31],
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "/opt/puppetlabs/bin/puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        environment => absent,
        user    => root,
        minute  => [5, 35],
    }
    cron { 'r10k-deploy2':
        ensure  => present,
        command => "/opt/puppetlabs/bin/r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml",
        environment => absent,
        #path    => absent,
        user    => root,
        minute  => [16, 46],
    }
    cron { 'puppet-apply2':
        ensure  => present,
        command => "/opt/puppetlabs/bin/puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        environment => absent,
        user    => root,
        minute  => [20, 50],
    }    
    cron { 'puppet-apply3':
        ensure  => absent,
    }    
    
    
    
    
    
    
    
}
