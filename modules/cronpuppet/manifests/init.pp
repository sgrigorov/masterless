class cronpuppet {
    cron { 'r10k-deploy':
        ensure  => present,
        command => "/opt/puppetlabs/bin/r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml",
        user    => root,
        minute  => [1, 11, 31, 41, 51],
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "/opt/puppetlabs/bin/puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        user    => root,
        minute  => [5, 15, 35, 45, 55],
    }
    cron { 'r10k-deploy2':
        ensure  => absent,
    }
    cron { 'puppet-apply2':
        ensure  => absent,
    }    
}
