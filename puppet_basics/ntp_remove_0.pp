###################################################
#  
# What's this?    : 
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
###################################################

package { 'ntp':
  ensure => 'purged',
}

file { '/etc/ntp.conf':
  ensure => 'absent',
}
