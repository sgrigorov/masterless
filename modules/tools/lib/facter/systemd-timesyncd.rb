Facter.add("gnomeshell_version") do
  confine { File.exist?('/usr/bin/gnome-shell') && File.executable?("/usr/bin/gnome-shell") }
  setcode do
    %x{/usr/bin/gnome-shell --version}.chomp.split(/\s+/).last.match(/\d\.\d+/)
  end
end
