Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd1}.split(/\n/)[1].split(/:/).last.strip.split(/\)/)[0]
  end
end
