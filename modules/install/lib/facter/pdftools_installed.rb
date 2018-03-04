Facter.add('pdftools_installed') do
  confine { File.exist?('/usr/NX/bin/nxserver') && File.executable?("/usr/NX/bin/nxserver") }
  setcode do
    %x{/usr/NX/bin/nxserver --version}.chomp.split(/\s+/).last
  end
end
