define ntp::admin_file ( 
  $ntp_location ='london',
  $monitor = true,
  ) {

  include ntp::params
  $admin_group = $ntp::params::admin_group
  
  $ntp_regional_server = $ntp_location ? {
    'london' => ['uk.pool.org', 'ie.pool.ntp.org'],
    'nyc'    => ['us.pool.org', 'ca.pool.ntp.org'],
    'paris'  => ['fr.pool.org', 'de.pool.ntp.org'],
    default  => ['us.ntp.org', 'us.pool.ntp.org'],
  }

  $ntp_local_server = '192.168.1.74'
  file { $title:
    ensure  => 'file',
    content => epp('ntp/ntp.conf.epp', {'monitor' => $monitor, 'ntp_local_server' => $ntp_local_server, 'ntp_regional_server' => $ntp_regional_server, }),
    owner   => 'root',
    group   => $admin_group,
    mode    => '0664',
    notify  => Class['ntp::service'],
  }
}
