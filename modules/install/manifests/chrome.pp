# install google chrome stable


class install::chrome {
  notify {"Message from Chrome Install":}
  case $facts['osfamily'] {
    'RedHat': {
        #[google-chrome]
        #name=google-chrome
        #baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
        #enabled=1
        #gpgcheck=1
        #gpgkey=https://dl.google.com/linux/linux_signing_key.pub
        file { 'chrome_repository':
            path    =>  '/etc/yum.repos.d/google-chrome1.repo',
            ensure  =>  present,
            content =>  '[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
',
            replace =>  false,
        }
     }
    'Debian': {
        file { 'chrome_repository':
            path    =>  '/etc/apt/sources.list.d/google-chrome.list',
            ensure  =>  present,
            content =>  'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main',
            replace =>  false,
        }
     }
  }
  package { "google-chrome-stable": 
      ensure => present,
      subscribe => File['chrome_repository'],
  }
}

