class cronpuppet {
  file {
    "/tmp/hello":
      ensure => file,
      source => "puppet:///modules/foo/hello";
  }
}
