# conditional statements node definition
# https://puppet.com/docs/puppet/5.3/lang_conditional.html
# variable scope
# https://puppet.com/docs/puppet/5.3/lang_scope.html
# ecternal node clasifier
# https://puppet.com/docs/puppet/5.3/nodes_external.html

#include foo
include cronpuppet

#The default node
node default {
  if $facts['dmi']['board']['serial_number'] == 'PCCKA00QE0Z07O' {
    warning('This is your laptop')
  }
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
