test_os_id='grep \^ID= /etc/os-release | sed "s/ID=//"'
echo $test_os_id
case $test_os_id in
  debian)
    echo "OS - Debian"
  ;;
  ubuntu)
    echo "OS - Ubuntu"
  ;;
  centos)
    echo "OS - CentOS"
  ;;
  fedora)
    echo "OS - Fedora"
  ;;
  *)
  ;;
esac
