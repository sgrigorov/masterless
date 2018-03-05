Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd}.chomp.split(/\s+/).last.match(/\d\.\d+/)
  end
end
