# _Description_
#
# Set a fact to return the version of GDM that is installed.
# This is useful for applying the correct configuration file syntax.
#
Facter.add("gnomeshell_version") do
  confine { File.exist?('/usr/sbin/gdm') && File.executable?("/usr/sbin/gdm") }
  setcode do
    %x{/usr/bin/gnome-shell --version}.chomp.split(/\s+/).last.match(/\d\.\d+/)
  end
end
