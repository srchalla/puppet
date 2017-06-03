###################################################
#  
# What's this?    : 
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
###################################################

user { 'bob':
  managehome => true,
  groups     => 'wheel',
  gid        => 'it',
  password   => pw_hash('Top$ecret', 'SHA-512', 'random'),
}

group { 'it':
  ensure => 'present',
}

