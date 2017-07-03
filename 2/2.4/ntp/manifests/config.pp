class ntp::config {
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
	  content => file('ntp/ntp.conf'),
	  notify  => Class['ntp::service'],
	}
}
