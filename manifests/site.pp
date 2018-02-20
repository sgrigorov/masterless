# conditional statements node definition
# https://puppet.com/docs/puppet/5.3/lang_conditional.html
# variable scope
# https://puppet.com/docs/puppet/5.3/lang_scope.html
# ecternal node clasifier
# https://puppet.com/docs/puppet/5.3/nodes_external.html

#include foo
include cronpuppet

class example {
  # Fedora 16GB + SSD laptop
  if $facts['dmi']['board']['serial_number'] == 'PCCKA00QE0Z07O' {
    notify {"Message from GitHub: This is the 16GB ram + SSD laptop":}
    include install::fedorarpmfusion
    include install::gnometools
    include install::media
#    include install
  }
  # Fedora 4GB at work
  if $facts['dmi']['board']['serial_number'] == 'CND0490K29' {
    notify {"Message from GitHub: This is the 4GB ram laptop at work":}
  }
  # Vagrant Ubuntu
  if $facts['dmi']['product']['uuid'] == '85496604-84C8-4E36-B45E-785668BC3C64' {
    notify {"Message from GitHub: This is Vagrant Ubuntu":}
  }
  # ESXi Centos
  if $facts['dmi']['product']['uuid'] == '564D72B9-071C-78AE-6AF9-A7D3F3275B98' {
    notify {"Message from GitHub: This is ESXi CentOS":}
  }
  # ZorinOS Desktop
  if $facts['dmi']['product']['uuid'] == '30AE8F00-A463-11E2-ADAE-8851FB409163' {
    notify {"Message from GitHub: This is ZorinOS Desktop":}
  }}

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
