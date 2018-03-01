# _Description_
#
# Set a fact to return the version of gnome-shell that is installed.
# This is useful for applying the correct configuration file syntax.
#
Facter.add("gnomeshell_version") do
  confine { File.exist?('/usr/bin/gnome-shell') && File.executable?("/usr/bin/gnome-shell") }
  setcode do
    %x{/usr/bin/gnome-shell --version}.chomp.split(/\s+/).last.match(/\d\.\d+/)
  end
end
