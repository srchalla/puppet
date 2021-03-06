define ntp::admin_file ( $ntp_location ='london') {

  include ntp::params
  $admin_group = $ntp::params::admin_group
  
  $ntp_regional_server = $ntp_location ? {
    'london' => 'uk.pool.org',
    'nyc'    => 'us.pool.org',
    'paris'  => 'fr.pool.org',
    default  => 'pool.ntp.org', 
  }

  $ntp_local_server = '192.168.1.74'
  $monitor = false 
  file { $title:
    ensure  => 'file',
    content => template('ntp/ntp.conf'),
    owner   => 'root',
    group   => $admin_group,
    mode    => '0664',
    notify  => Class['ntp::service'],
  }
}
