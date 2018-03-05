Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl show -p LoadState systemd-timesyncd}.split(/\n/)[0]
  end
end
