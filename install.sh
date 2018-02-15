puppet_dir=puppet

test_os_id=`grep \^ID= /etc/os-release | sed "s/ID=//"| sed "s/\"//g"`
echo "OS:"$test_os_id"<"
case $test_os_id in
  debian)
    echo "OS - Debian"
    apt-get install puppet r10k git -y
    # To enable the repository:
    #wget http://apt.puppetlabs.com/puppet5-release-jessie.deb # Debian 8 (Jessie)
    #wget http://apt.puppetlabs.com/puppet5-release-stretch.deb # Debian 9 (Stretch)
    #dpkg -i puppet5-release-stretch.deb
    #apt-get update
    #apt-get install puppet
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
    #rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm
    #rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
    yum install git puppet -y
    source /etc/profile.d/puppet-agent.sh
    /opt/puppetlabs/puppet/bin/gem install r10k
    ln -s /opt/puppetlabs/puppet/bin/r10k /opt/puppetlabs/bin/r10k
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
#/usr/local/bin/r10k deploy environment -p -c /etc/$puppet_dir/r10k/r10k.yaml
#https://github.com/adrienthebo/r10k/blob/master/doc/dynamic-environments/quickstart.mkd
r10k deploy environment -p -c /etc/$puppet_dir/r10k/r10k.yaml
#curl https://raw.githubusercontent.com/sgrigorov/masterless/production/files/$puppet_dir/10_r10k_deploy_environment /etc/cron.hourly/10r10k_deploy_environment
#chmod 755 /etc/cron.hourly/10r10k_deploy_environment
# copy puppet.conf
# puppet agent -t
#puppet apply /etc/$puppet_dir/code/environments/production/manifests/site.pp
puppet apply  /etc/puppetlabs/code/environments/production/manifests/site.pp 

