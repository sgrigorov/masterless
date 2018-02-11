touch /tmp/install1.sh
if [(lsb_release -i | sed 's/^Distributor ID:\t// ') -eq 'Fedora']
than
  touch /tmp/install.yes.sh
  exit 0
