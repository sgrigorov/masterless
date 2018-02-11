touch /tmp/install1.sh
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Fedoraa > /dev/null && touch /tmp/install1.yes.sh
