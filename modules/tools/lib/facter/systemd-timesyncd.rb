Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl show -p LoadState systemd-timesyncd}
  end
end
