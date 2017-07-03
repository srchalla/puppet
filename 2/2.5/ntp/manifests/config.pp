class ntp::config ( $location = 'london' ) {
  $valid_locations = [
    '^london$',
    '^paris$',
    '^nyc$',
  ]
  validate_re($location, $valid_locations)
	case $facts['os']['family'] {
	  'RedHat': {
	    $admingroup = 'wheel'
	  }
	  'Debian': {
	    $admingroup = 'sudo'
	  }
	  default : {
	    fail("Your ${facts['os']['family']} is not supported")
	  }
	}
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
