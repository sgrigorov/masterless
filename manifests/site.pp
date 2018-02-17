#include foo
include cronpuppet

#The default node
#node default {
#}

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
