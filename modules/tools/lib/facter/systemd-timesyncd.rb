Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd}.split(/\n/)[1].split(/:/).last.delete(' ')}
  end
end
