touch /tmp/install2
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Ubuntu > /dev/null && {
  touch /tmp/install.ubuntu.sh
}
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Fedora > /dev/null && {
  touch /tmp/install.fedora1.sh
  rpm -qa puppet | sed 's/-.*//' | grep puppet > /dev/null || {
    dnf install puppet git -y
  }
}
grep \^ID= /etc/os-release | grep "centos" > /dev/null && {
  yum install git puppet -y
  gem install r10k
}
