install_puppetlabs_dir=/etc/puppetlabs
install_puppet_dir=/etc/puppet

test_os_id=`grep \^ID= /etc/os-release | sed "s/ID=//"`
case $test_os_id in
  debian)
    echo "OS - Debian"
    apt-get install puppet r10k git -y
  ;;
  ubuntu)
    echo "OS - Ubuntu"
    apt-get install puppet r10k git -y
  ;;
  zorin)
    echo "OS - ZorinOS"
    apt-get install puppet r10k git -y
  ;;
  centos)
    echo "OS - CentOS"
    rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
    yum install git puppet rubygems -y
    gem install r10k
  ;;
  fedora)
    echo "OS - Fedora"
    dnf install puppet git -y
    gem install r10k
  ;;
  *)
    echo "OS - Other"
  ;;
esac

mkdir $install_puppet_dir/r10k
wget https://raw.githubusercontent.com/sgrigorov/masterless/production/files/puppet/r10k.yaml -P $install_puppet_dir/r10k
