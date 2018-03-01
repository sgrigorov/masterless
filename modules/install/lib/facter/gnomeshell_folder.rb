#test
#USER_PATH="$HOME/.local/share/gnome-shell/extensions"
#[ -f /etc/debian_version ] && SYSTEM_PATH="/usr/local/share/gnome-shell/extensions" || SYSTEM_PATH="/usr/share/gnome-shell/extensions"
# Return the UUID of the partition holding the /boot directory
Facter.add('gnomeshell_folder') do
  confine :kernel => 'Linux'
  setcode do
    folder = case Facter.value(:osfamily)
      when "RedHat" then "/usr/share/gnome-shell/extensions"
      when "Debian" then "/usr/local/share/gnome-shell/extensions"
        if File.directory? "/usr/local/share/gnome-shell/extensions"
          "/usr/local/share/gnome-shell/extensions"
        end
        if File.directory? "/usr/share/gnome-shell/extensions"
          "/usr/share/gnome-shell/extensions"
        end
    end      
  end
end
