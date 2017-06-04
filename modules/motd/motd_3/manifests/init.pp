class motd ( $motd_message = 'Weekly' ) {
  
  $allowed = [ '^Weekly$', '^Daily$' ]
  validate_re($motd_message, $allowed)

  myfile { '/etc/myfile':
    ensure  => 'present',
    #content => file("motd/${motd_message}"),
  }
}

