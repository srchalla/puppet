class ntp::params {
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
}
