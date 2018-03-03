Facter.add('nomachine_installed') do
  confine { :kernel => 'Linux' && File.exist?('/usr/NX/bin/nxserver') && File.executable?("/usr/NX/bin/nxserver") }
  setcode do
    %x{/usr/NX/bin/nxserver}.chomp.split(/\s+/).last
  end
end
