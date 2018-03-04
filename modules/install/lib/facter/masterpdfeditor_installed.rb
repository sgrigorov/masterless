Facter.add('masterpdfeditor_installed') do
  confine { File.exist?('/usr/bin/masterpdfeditor4') && File.executable?("/usr/bin/masterpdfeditor4") }
  setcode do
    "masterpdfeditor4"
  end
end
