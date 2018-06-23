# install google chrome stable
#
#!!!!!! for Fedora - sudo dnf install fedora-workstation-repositories
#Currently, enabling the new third-party repositories allows easy installation of the following software:
#
#Google Chrome — a web browser (Fedora 27 & Fedora 28)
#PyCharm — a Python IDE (Fedora 27 & Fedora 28)
#NVIDIA graphics drivers (Fedora 28 only)
#Steam — a digital distribution method primarily used for games (Fedora 28 only)


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
        yumrepo { 'google-chrome':  enabled => 'true'}
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
  }
}

#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
