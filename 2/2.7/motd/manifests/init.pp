class motd ( $motd_message = 'Daily' ) {
  $allowed = [
    '^Daily$',
    '^Weekly$',
  ]
  validate_re( $motd_message, $allowed )
  myfile { '/etc/myfile' :
    ensure => 'absent',
  }
}
