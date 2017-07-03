#Manage NTP on CentOS and Ubuntu hosts
class ntp {	
	
	package { 'ntp':
	  before => Class['ntp::config'],
	}
    include ntp::config
    include ntp::service
	
	
  }
