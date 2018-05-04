# install google chrome stable


class install::chrome {
  notify {"Message from Chrome Install":}
  case $facts['osfamily'] {
    'RedHat': {
        file { 'chrome_repository':
            path    =>  '/etc/yum.repos.d/google-chrome.repo',
            ensure  =>  present,
            content =>  '[google-chrome]
                         name=google-chrome
                         baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
                         enabled=1
                         gpgcheck=1
                         gpgkey=https://dl.google.com/linux/linux_signing_key.pub',
            replace =>  false,
        }
     }
    'Debian': {
        file { 'chrome_repository':
            path    =>  '/etc/apt/sources.list.d/google-chrome.list',
            content =>  'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main',
            replace =>  false,
            notify    => Exec['apt_key_add'],
        }
        exec { 'apt_key_add':
          command     => "/usr/bin/wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -",
          #refreshonly => true,
          notify    => Exec['apt_update'],
        }
        exec { 'apt_update':
          command     => "/usr/bin/apt update -y",
          #refreshonly => true,
        }
     }
  }
  notify {"Message from Chrome Install - package":}
  package { "google-chrome-stable": 
      ensure          => present,
      subscribe       => File['chrome_repository'],
      install_options => ['--enablerepo'],
  }
}

#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
