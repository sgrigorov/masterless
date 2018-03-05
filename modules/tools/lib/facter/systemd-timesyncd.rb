Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd}.chomp.split(/\n/)[1].split(/:/).last
  end
end
