# conditional statements node definition
# https://puppet.com/docs/puppet/5.3/lang_conditional.html
# variable scope
# https://puppet.com/docs/puppet/5.3/lang_scope.html
# ecternal node clasifier
# https://puppet.com/docs/puppet/5.3/nodes_external.html

#include foo
include cronpuppet
include install::puppetfile::r10k

class example {
  # Fedora 16GB + SSD laptop
  if $facts['dmi']['product']['serial_number'] == 'CNU12807HN' {
    notify {"Message from GitHub: This is the 16GB ram + SSD laptop":}
    include install::rpmfusion
    include install::gnometools
    include install::media
    include install::nomachine
    include install::pdftools
    include install::timesyncd
    include install::chrome
    include install::backgrounds
#    include install
  }
  # Fedora 4GB at work
  if $facts['dmi']['product']['serial_number'] == 'CND0490K29' {
    notify {"Message from GitHub: This is the 4GB ram laptop at work":}
    include install::rpmfusion
    include install::chrome
    #include install::timesyncd
  }
  # Vagrant Ubuntu
  if $facts['dmi']['product']['uuid'] == '85496604-84C8-4E36-B45E-785668BC3C64' {
    notify {"Message from GitHub: This is Vagrant Ubuntu":}
  }
  # ESXi Centos - 192.168.0.110
  if $facts['dmi']['product']['uuid'] == '564D72B9-071C-78AE-6AF9-A7D3F3275B98' {
    notify {"Message from GitHub: This is ESXi CentOS":}
   include install::timesyncd
  }
  # ZorinOS Desktop - 192.168.0.135
  if $facts['dmi']['product']['uuid'] == '30AE8F00-A463-11E2-ADAE-8851FB409163' {
    notify {"Message from GitHub: This is ZorinOS Desktop":}
    include install::sshserver
    include install::nomachine
    #include install::tools
    include install::pdftools
    include install::puppetfile::r10k
    include install::timesyncd
    include install::chrome
  }
  # BSM-CHA-01 - 192.168.0.128
  if $facts['dmi']['product']['serial_number'] == '2UA22425L5' {
    notify {"Message from GitHub: This is BSM-CHA-01 Desktop":}
    include install::sshserver
    include install::timesyncd
    include install::rpmfusion
  }
  # zorin-03 - test laptop - 192.168.2.129
  if $facts['dmi']['product']['serial_number'] == 'CND0490K2M' {
    notify {"Message from GitHub: This is zorin-03 Laptop":}
    #include install::sshserver
    #include install::nomachine
    #include install::pdftools
    include puppet_test_install
  }  
  if $facts['dmi']['product']['serial_number'] == '2CE9374JBN' {
    notify {"Message from GitHub: This is fedoratest01 Laptop":}
    #include install::sshserver
    #include install::nomachine
    #include install::pdftools
    include puppet_test_install
    include install::rpmfusion
  }
  if $facts['dmi']['product']['serial_number'] == '2CE9374JBQ' {
    notify {"Message from GitHub: This is ubuntu test Laptop":}
    #include install::sshserver
    #include install::nomachine
    #include install::pdftools
    include puppet_test_install
  }
  if $facts['hostname'] == 'ub1804-01' {
    notify {"Message from GitHub: This is ubuntu 18.04 LTS test Laptop":}
    #include install::sshserver
    #include install::nomachine
    #include install::pdftools
    #include puppet_test_install
    include install::chrome
  }  
  if $facts['hostname'] == 'stan-virtual-machine' {
    notify {"Message from GitHub: This is ubuntu 18.04 LTS test Virtual Machine":}
    include install::sshserver
    include install::nomachine
    #include install::pdftools
    #include puppet_test_install
    include install::chrome
    include install::rpmfusion
  }
  # 2CE9374JBN - fedoratest01 - 192.168.2.166
  # 2CE9374JBQ - ubuntu 192.168.2.186
  
 }

class puppet_test_install {
    include install::sshserver
    include install::nomachine
    include install::pdftools
    #include tools::time_syncd
    include install::timesyncd
    include install::chrome
}



#The default node
node default {
include example
}

#Multiple names
#node 'www1.example.com', 'www2.example.com', 'www3.example.com' {
#  include common
#  include apache, squid
#}

#Regular expression names
#node /^www\d+$/ {
#  include common
#}
#The above example would match www1, www13, and any other node whose name consisted of www and one or more digits.
#node /^(foo|bar)\.example\.com$/ {
#  include common
#}
#The above example would match foo.example.com and bar.example.com, but no other nodes.
