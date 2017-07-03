File_line {
  path => '/etc/motd',
}

file_line { 'motd':
  line => 'Server will be down at 17:00',
}
