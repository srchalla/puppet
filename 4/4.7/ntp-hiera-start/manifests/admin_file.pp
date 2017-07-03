define ntp::admin_file ( 
  $ntp_location = 'london',
  $monitor = false,  
) {
  include ntp::params
  $admingroup = $ntp::params::admingroup
  $ntp_regional_server = $ntp_location ? {
    'london' => ['uk.pool.ntp.org', 'ie.pool.ntp.org',],
    'paris'  => ['fr.pool.ntp.org', 'de.pool.ntp.org',],
    'nyc'    => ['us.pool.ntp.org', 'ca.pool.ntp.org',],
    default  => ['uk.pool.ntp.org', 'us.pool.ntp.org',],
  }
  
  $ntp_local_server = '192.168.0.3'

  file { $title :
    content                 =>     epp('ntp/ntp.conf.epp', {
      'monitor'             => $monitor,
      'ntp_local_server'    => $ntp_local_server,
      'ntp_regional_server' => $ntp_regional_server, }
    ),
    owner   => 'root',
    group   => $admingroup,
    mode    => '0664',
    ensure  => 'file',
    notify  => Class['ntp::service'],
  }
}
