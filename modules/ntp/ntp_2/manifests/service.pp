class ntp::service {
 
  case $facts['os']['family'] {
    'RedHat': {
       $ntp_service = 'ntpd'
     }  
    'Debian': {
       $ntp_service = 'ntp'
    }
    default: {
      fail ("The ${facts['os']['family']} is not supported")
    }
  }

  service { $ntp_service:
    ensure => 'running',
	enable => 'true',
	#name   => 'ntpd'
  }
}
