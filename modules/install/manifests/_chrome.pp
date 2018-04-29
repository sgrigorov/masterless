# install google chrome stable


class install::chrome {
  notify {"Message from Chrome Install":}
  $google-chrome_str = "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
  file { '/etc/apt/sources.list.d/google-chrome.list':
      content => $google-chrome_str,
      replace   => false,
      #notify    => Exec['r10k_puppetfile'],
    }
  #package { "mypaint": ensure => present, }
}

