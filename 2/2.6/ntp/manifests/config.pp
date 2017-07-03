class ntp::config ( 
  $location = 'london',
  $admingroup = $ntp::params::admingroup,
) inherits ntp::params {
  $valid_locations = [
    '^london$',
    '^paris$',
    '^nyc$',
  ]
  validate_re($location, $valid_locations)
	File {
	  owner  => 'root',
	  group  => $admingroup,
	  mode   => '0664',
	  ensure => 'file',
	}
	
	file { '/etc/ntp.conf':
	  content => file("ntp/${location}"),
	  notify  => Class['ntp::service'],
	}
}
