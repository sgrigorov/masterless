Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd1}.chomp.split(/:/).last
  end
end
