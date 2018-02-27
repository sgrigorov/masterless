#https://github.com/brunelli/gnome-shell-extension-installer/blob/master/gnome-shell-extension-installer
#http://bernaerts.dyndns.org/linux/76-gnome/283-gnome-shell-install-extension-command-line-script
#http://bernaerts.dyndns.org/linux/76-gnome/345-gnome-shell-install-remove-extension-command-line-script

#file { '/devops/RRDI-repo-Linux64-5.0.2GA.zip':
#  source => 'puppet:///somemodule//devops/RRDI-repo-Linux64-5.0.2GA.zip'
#  notify => Exec['unzip'],
#}

#file { '/tmp/RRDI_INSTALLATION/':
#  ensure => 'directory',
#  mode   => '1777',
#  owner  => 'user',
#  group  => 'user',
#}

#exec { 'unzip':
#  command     => 'unzip /devops/RRDI-repo-Linux64-5.0.2GA.zip -d /tmp/RRDI_INSTALLATION/',
#  cwd         => '/home/user/',
#  user        => 'root',
#  require     => File["/tmp/RRDI_INSTALLATION/"],
#  refreshonly => true,
#}

#https://forge.puppet.com/puppet/archive
#archive { '/tmp/something':
#  ensure        => present,
#  extract       => true,
#  extract_path  => '/tmp',
#  source        => 'http://www.somewhere.com/something.tar.gz',
#  checksum      => 'checksum hash',
#  checksum_type => 'sha1',
#  creates       => '/tmp/something',
#  cleanup       => true,
#}

#https://extensions.gnome.org/extension-info/?pk=extension-id&shell_version=version
#     on a per-user basis in ~/.local/share/gnome-shell/extensions/extension-uuid/
#     on a system wide basis in /usr/local/share/gnome-shell/extensions/extension-uuid/
# wget -O extension.zip "https://extensions.gnome.org/download-extension/apps-menu@gnome-shell-extensions.gcampax.github.com.shell-extension.zip?version_tag=3247"
# mkdir -p "$HOME/.local/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com"
# unzip -op extension.zip -d "$HOME/.local/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com"

extensions_dir=~/.local/share/gnome-shell/extensions/

download_url="/download-extension/apps-menu@gnome-shell-extensions.gcampax.github.com.shell-extension.zip?version_tag=3247"
extension_uuid="apps-menu@gnome-shell-extensions.gcampax.github.com"

wget -O extension.zip "https://extensions.gnome.org$download_url"
# mkdir -p "$HOME/.local/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com"
# unzip -op extension.zip -d "$HOME/.local/share/gnome-shell/extensions/apps-menu@gnome-shell-extensions.gcampax.github.com"


