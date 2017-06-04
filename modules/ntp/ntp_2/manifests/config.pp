class ntp::config ( $location = 'nyc')
{
  $allowed = [ '^london$', '^paris$', '^nyc$' ]
  validate_re($location, $allowed)

  case $facts['os']['family'] {
    'Redhat': {
      $admin_group = 'wheel'
     }

   'Debian': {
     $admin_group = 'sudo'
    }

   Default: {
     fail ("The ${facts['os']['family']} is not supported")
    }
  }

  file { '/etc/ntp.conf':
    ensure  => 'file',
    content => file("ntp/${location}"),
    owner   => 'root',
    group   => $admin_group, 
	mode    => '0660',
    notify  => Class['ntp::service']
	}
}
