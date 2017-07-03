class ntp::params {
	case $facts['os']['family'] {
	  'RedHat': {
	    $ntp_service = 'ntpd'
	    $admingroup = 'wheel'
	  }
	  'Debian': {
	    $ntp_service = 'ntp'
	    $admingroup = 'sudo'
	  }
	  default : {
	    fail("Your ${facts['os']['family']} is not supported")
	  }
	}
}
