#############################################################################
#  
# What's this?    : 
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
#############################################################################

$ntp_conf = @(END) 
# Managed by Puppet
Server 192.168.1.74 iburst
driftfile /var/lib/ntp/drift
END 

case $facts['os']['family'] {
  'Redhat': {
    $ntp_service = 'ntpd'
    $admin_group = 'wheel'
  }
  'Debian': {
    $ntp_service = 'ntp'
    $admin_group = 'sudo'
  }
  Default: { 
    fail ("The ${facts['os']['family']} is not supported")
  }
}


package { 'ntp':
  ensure => present,
}

file { '/etc/ntp.conf':
  ensure  => 'file',
  content => $ntp_conf,
  owner   => 'root',
  group   => $admin_group, 
  mode    => '0660',
}

service { $ntp_service:
  ensure => 'running',
  enable => 'true',
  #name   => 'ntpd'
}

