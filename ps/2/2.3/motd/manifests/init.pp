class motd {

  file { '/etc/motd':
    ensure  => 'present',
    content => file('motd/message'),
  }
}
