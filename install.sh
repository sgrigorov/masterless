puppet_dir=puppet

test_os_id=`grep \^ID= /etc/os-release | sed "s/ID=//"| sed "s/\"//g"`
echo "OS:"$test_os_id"<"
case $test_os_id in
  debian)
    echo "OS - Debian"
    apt-get install puppet r10k git -y
    exit
  ;;
  ubuntu)
    echo "OS - Ubuntu"
    apt-get install puppet r10k git -y
    exit
  ;;
  zorin)
    echo "OS - ZorinOS"
    apt-get install puppet r10k git -y
    exit
  ;;
  centos)
    echo "OS - CentOS"
    puppet_dir=puppetlabs
    rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
    yum install git puppet vim rubygems -y
    gem install r10k
  ;;
  fedora)
    echo "OS - Fedora"
    dnf install puppet git -y
    gem install r10k
    exit
  ;;
  *)
    echo "OS - Other"
    exit
  ;;
esac

mkdir /etc/$puppet_dir/r10k
curl https://raw.githubusercontent.com/sgrigorov/masterless/production/files/$puppet_dir/r10k.yaml > /etc/$puppet_dir/r10k/r10k.yaml
/usr/local/bin/r10k deploy environment -p -c /etc/$puppet_dir/r10k/r10k.yaml
