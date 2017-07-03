class ntp::config ($location = 'nyc',) 
{
  $allowed = [ '^london$', '^paris$', '^nyc$' ]
  validate_re($location, $allowed)
  

  ntp::admin_file {'/etc/ntp.conf':
    ntp_location => 'nyc',
    monitor     => true,
  }

}
