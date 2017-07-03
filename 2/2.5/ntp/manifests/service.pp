class ntp::service {
	case $facts['os']['family'] {
	  'RedHat': {
	    $ntp_service = 'ntpd'
	  }
	  'Debian': {
	    $ntp_service = 'ntp'
	  }
	  default : {
	    fail("Your ${facts['os']['family']} is not supported")
	  }
	}
	service {'NTP_Service':
	  ensure    => 'running',
	  enable    => true,
	  name      => $ntp_service,
	  subscribe => Class['ntp::config'],
	}
}
