# install google chrome stable


class install::chrome {
  notify {"Message from Chrome Install":}
  case $facts['osfamily'] {
    'RedHat': {
        $google_chrome_str = "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
        file { '/etc/apt/sources.list.d/google-chrome.list':
            content => $google_chrome_str,
            replace   => false,
        }
        package { "google-chrome-stable": 
            ensure => present,
            subscribe => File['/etc/apt/sources.list.d/google-chrome.list'],
        }
     }
    'Debian': {
        $google_chrome_str = "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
        file { 'chrome_repository':
            path    =>  '/etc/apt/sources.list.d/google-chrome.list',
            ensure  =>  present,
            content =>  $google_chrome_str,
            replace =>  false,
        }
     }
  }
  package { "google-chrome-stable": 
      ensure => present,
      subscribe => File['chrome_repository'],
  }
}

