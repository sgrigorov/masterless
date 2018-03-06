Facter.add("systemd-timesyncd") do
  confine { 
    ! File.exist?('/usr/sbin/ntpd') || ! File.exist?('/usr/sbin/openntpd') || ! File.exist?('/usr/sbin/chronyd') || ! File.exist?('/usr/sbin/VBoxService')
    }
  setcode do
    %x{/bin/systemctl show -p LoadState systemd-timesyncd}.split(/\n/)[0]
  end
end
