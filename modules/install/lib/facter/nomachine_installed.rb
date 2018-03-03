Facter.add('nomachine_installed') do
  confine { File.exist?('/usr/NX/bin/nxserver') && File.executable?("/usr/NX/bin/nxserver") }
  setcode do
    %x{/usr/bin/gnome-shell --version}.chomp.split(/\s+/).last.match(/\d\.\d+/)
  end
end
