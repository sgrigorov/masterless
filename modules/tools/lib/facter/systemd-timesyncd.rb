Facter.add("systemd-timesyncd") do
  setcode do
    %x{/bin/systemctl status systemd-timesyncd}
  end
end
