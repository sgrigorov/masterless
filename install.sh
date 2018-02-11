touch /tmp/install2
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Ubuntu > /dev/null && touch /tmp/install.ubuntu.sh
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Fedora > /dev/null && {
  touch /tmp/install.fedora1.sh






}
