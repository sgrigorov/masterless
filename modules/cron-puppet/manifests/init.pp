class cron-puppet {
    cron { 'puppet-apply':
        ensure  => present,
        command => "puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp",
        user    => root,
        minute  => '*/30',
    }
}
