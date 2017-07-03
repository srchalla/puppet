class ntp::service (
  $ntp_service = $ntp::params::ntp_service
  ) inherits ntp::params  
{
 
  service { $ntp_service:
    ensure => 'running',
	enable => 'true',
	#name   => 'ntpd'
  }
}
