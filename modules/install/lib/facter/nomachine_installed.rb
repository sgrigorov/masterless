Facter.add('nomachine_installed') do
  confine :kernel => 'Linux'
  setcode do
    folder = case Facter.value(:osfamily)
      when "RedHat" then
        if File.directory? "/usr/share/gnome-shell/extensions"
          "/usr/share/gnome-shell/extensions"
        end
      when "Debian" then
        if File.directory? "/usr/local/share/gnome-shell/extensions"
          "/usr/local/share/gnome-shell/extensions"
        end
        if File.directory? "/usr/share/gnome-shell/extensions"
          "/usr/share/gnome-shell/extensions"
        end
    end      
  end
end
