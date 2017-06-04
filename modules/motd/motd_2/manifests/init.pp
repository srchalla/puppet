class motd ( $motd_message = 'Weekly' ) {
 
  file { '/etc/motd':
    ensure  => 'present',
    content => file("motd/${motd_message}"),
  }
}

