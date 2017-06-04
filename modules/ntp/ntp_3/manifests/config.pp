class ntp::config ( 
  $adming_group = $ntp::params::admin_group, 
  $location = 'nyc',
  ) inherits ntp::params
{
  $allowed = [ '^london$', '^paris$', '^nyc$' ]
  validate_re($location, $allowed)

  file { '/etc/ntp.conf':
    ensure  => 'file',
    content => file("ntp/${location}"),
    owner   => 'root',
    group   => $admin_group, 
	mode    => '0660',
    notify  => Class['ntp::service']
	}
}
