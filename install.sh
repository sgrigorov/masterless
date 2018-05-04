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
      # To enable the repository:
      case $test_os_ver_id in
        8)
          echo "Debian 8 (Jessie)"
          wget -O /tmp/puppet5-release-jessie.deb http://apt.puppetlabs.com/puppet5-release-jessie.deb
          dpkg -i /tmp/puppet5-release-jessie.deb 
          apt_install
        ;;
        9)
          echo "Debian 9 (Stretch)"
          wget -O /tmp/puppet5-release-stretch.deb http://apt.puppetlabs.com/puppet5-release-stretch.deb
          dpkg -i /tmp/puppet5-release-stretch.deb
          apt_install
        ;;
        *)
            echo "Other Debian - exit"
            exit
        ;;
      esac

    ;;
    ubuntu)
        echo "OS - Ubuntu"
        case $test_os_ver_id in
            14.04)
                echo "Ubuntu" $test_os_ver_id
                # Ubuntu 14.04 (Trusty Tahr)
                wget -O /tmp/puppet5-release-trusty.deb http://apt.puppetlabs.com/puppet5-release-trusty.deb
                dpkg -i /tmp/puppet5-release-trusty.deb
                apt_install
             ;;
            18.04|17.10|16.04)
                echo "Ubuntu" $test_os_ver_id
                # Ubuntu 16.04 (Xenial Xerus)
                wget -O /tmp/puppet5-release-xenial.deb http://apt.puppetlabs.com/puppet5-release-xenial.deb
                dpkg -i /tmp/puppet5-release-xenial.deb
                apt_install
             ;;
             *)
                echo "Other Ubuntu - exit"
             exit
        ;;
        esac
      # http://apt.puppetlabs.com/puppet-release-xenial.deb
      # http://apt.puppetlabs.com/puppet5-release-xenial.deb
      # http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
    ;;
    zorin)
      echo "OS - ZorinOS"
      echo "Ubuntu" $test_os_ver_id
      wget -O /tmp/puppet5-release-xenial.deb http://apt.puppetlabs.com/puppet5-release-xenial.deb # Ubuntu 16.04 (Xenial Xerus)
      dpkg -i /tmp/puppet5-release-xenial.deb
      apt_install
    ;;
    centos)
      echo "OS - CentOS"
      # To enable the repository:
      case $test_os_ver_id in
        7)
            echo "CentOS 7"            
            rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
            yum install git wget puppet-agent -y
        ;;
        *)
            echo "Other CentOS - exit"
        exit
        ;;
      esac
      #rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm
      #rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
    ;;
    fedora|chapeau)
      echo "OS - Fedora"
      case $test_os_ver_id in
        25)
            echo "Fedora 25"
            rpm -ivh http://yum.puppetlabs.com/puppet/puppet5-release-fedora-25.noarch.rpm
            dnf install git puppet-agent -y
        ;;
        26)
            echo "Fedora 26-27"
            rpm -ivh http://yum.puppetlabs.com/puppet/puppet5-release-fedora-26.noarch.rpm
            dnf install git puppet-agent -y
        ;;
        27|28)
            echo "Fedora 26-27"
            rpm -ivh http://yum.puppetlabs.com/puppet/puppet5-release-fedora-27.noarch.rpm
            dnf install git puppet-agent -y
        ;;
        *)
            echo "Other Fedora - exit"
            exit
        ;;
      esac
    ;;
    *)
      echo "OS - Other"
      exit
    ;;
  esac
elif grep "CentOS release 6" /etc/centos-release ; then
    echo "CentOS 6"    
    rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm
    yum install git puppet-agent -y
else
    exit
fi
source /etc/profile.d/puppet-agent.sh
/opt/puppetlabs/puppet/bin/gem install r10k
if [ ! -L "/opt/puppetlabs/bin/r10k" ]; then ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k; fi
#ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k
if [ ! -d "/etc/puppetlabs/r10k" ]; then mkdir /etc/puppetlabs/r10k; fi
#mkdir /etc/puppetlabs/r10k
wget -O /etc/puppetlabs/r10k/r10k.yaml https://raw.githubusercontent.com/sgrigorov/masterless/production/files/puppetlabs/r10k.yaml
#/usr/local/bin/r10k deploy environment -p -c /etc/$puppet_dir/r10k/r10k.yaml
#https://github.com/adrienthebo/r10k/blob/master/doc/dynamic-environments/quickstart.mkd
/opt/puppetlabs/bin/r10k deploy environment -p -c /etc/puppetlabs/r10k/r10k.yaml
#curl https://raw.githubusercontent.com/sgrigorov/masterless/production/files/$puppet_dir/10_r10k_deploy_environment /etc/cron.hourly/10r10k_deploy_environment
#puppet apply /etc/$puppet_dir/code/environments/production/manifests/site.pp
puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp 
