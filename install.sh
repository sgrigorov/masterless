test_os_id=`grep \^ID= /etc/os-release | sed "s/ID=//"`
echo $test_os_id
case $test_os_id in
  debian)
    echo "OS - Debian"
    apt-get install puppet r10k git
  ;;
  ubuntu)
    echo "OS - Ubuntu"
    apt-get install puppet r10k git
  ;;
  zorin)
    echo "OS - ZorinOS"
    apt-get install puppet r10k git
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
