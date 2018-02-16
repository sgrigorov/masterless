

function apt_install {
    apt-get update
    apt-get -y install puppet-agent git
}

if [ -f "/etc/os-release" ]; then
  test_os_id=`grep \^ID= /etc/os-release | sed "s/ID=//"| sed "s/\"//g"`
  test_os_ver_id=`grep \^VERSION_ID= /etc/os-release | sed "s/VERSION_ID=//"| sed "s/\"//g"`
  echo "OS:"$test_os_id"<"
  case $test_os_id in
    debian)
      echo "OS - Debian"
      #apt-get install puppet r10k git -y
      # To enable the repository:
      case $test_os_ver_id in
        8)
          # Debian 8 (Jessie)
          wget -O /tmp/puppet5-release-jessie.deb http://apt.puppetlabs.com/puppet5-release-jessie.deb
          dpkg -i /tmp/puppet5-release-jessie.deb 
        ;;
        9)
          # Debian 9 (Stretch)
          wget -O /tmp/puppet5-release-stretch.deb http://apt.puppetlabs.com/puppet5-release-stretch.deb
          dpkg -i /tmp/puppet5-release-stretch.deb
        ;;
      esac
      apt_install
    ;;
    ubuntu)
      echo "OS - Ubuntu"
      # To enable the repository:
      wget -O /tmp/puppet5-release-xenial.deb http://apt.puppetlabs.com/puppet5-release-xenial.deb # Ubuntu 16.04 (Xenial Xerus)
      dpkg -i /tmp/puppet5-release-xenial.deb
      apt_install
      # http://apt.puppetlabs.com/puppet-release-xenial.deb
      # http://apt.puppetlabs.com/puppet5-release-xenial.deb
      # http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
    ;;
    zorin)
      echo "OS - ZorinOS"
      wget -O /tmp/puppet5-release-xenial.deb http://apt.puppetlabs.com/puppet5-release-xenial.deb # Ubuntu 16.04 (Xenial Xerus)
      dpkg -i /tmp/puppet5-release-xenial.deb
      apt_install
    ;;
    centos)
      echo "OS - CentOS"
      # To enable the repository:
      case test_os_ver_id in
        7)
          rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
        ;;
      esac
      #rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm
      #rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
      yum install git puppet-agent -y
    ;;
    fedora)
      echo "OS - Fedora"
      rpm -ivh http://yum.puppetlabs.com/puppet/puppet5-release-fedora-26.noarch.rpm
      dnf install git puppet-agent -y
    ;;
    *)
      echo "OS - Other"
      exit
    ;;
  esac
elif [ grep "CentOS release 6" /etc/centos-release ]; then
  rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm
  yum install git puppet-agent -y
fi
source /etc/profile.d/puppet-agent.sh
/opt/puppetlabs/puppet/bin/gem install r10k
ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k
mkdir /etc/puppetlabs/r10k
wget -O /etc/puppetlabs/r10k/r10k.yaml https://raw.githubusercontent.com/sgrigorov/masterless/production/files/puppetlabs/r10k.yaml
#/usr/local/bin/r10k deploy environment -p -c /etc/$puppet_dir/r10k/r10k.yaml
#https://github.com/adrienthebo/r10k/blob/master/doc/dynamic-environments/quickstart.mkd
r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml
#curl https://raw.githubusercontent.com/sgrigorov/masterless/production/files/$puppet_dir/10_r10k_deploy_environment /etc/cron.hourly/10r10k_deploy_environment
#chmod 755 /etc/cron.hourly/10r10k_deploy_environment
# copy puppet.conf
# puppet agent -t
#puppet apply /etc/$puppet_dir/code/environments/production/manifests/site.pp
puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp 






