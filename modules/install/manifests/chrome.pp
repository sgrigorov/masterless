# install google chrome stable


class install::chrome {
  notify {"Message from Chrome Install":}
  $google_chrome_str = "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
  file { '/etc/apt/sources.list.d/google-chrome.list':
      content => $google_chrome_str,
      replace   => false,
      #notify    => package['google-chrome-stable'],
    }
  package { "google-chrome-stable": 
      ensure => present,
      subscribe => File['/etc/apt/sources.list.d/google-chrome.list'],
    }
}

