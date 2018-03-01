#test
#USER_PATH="$HOME/.local/share/gnome-shell/extensions"
#[ -f /etc/debian_version ] && SYSTEM_PATH="/usr/local/share/gnome-shell/extensions" || SYSTEM_PATH="/usr/share/gnome-shell/extensions"
# Return the UUID of the partition holding the /boot directory
Facter.add('gnomeshell_folder') do
  confine :kernel => 'Linux'
  confine { Folder.exist?('/usr/local/share/gnome-shell/extensions') || Folder.exist?("/usr/share/gnome-shell/extensions") }

  setcode do
    folder = case Facter.value(:osfamily)
      when "RedHat" than {
        if Folder.exist?("/usr/share/gnome-shell/extensions")
          "/usr/share/gnome-shell/extensions"
        end        
        }
  end
end
