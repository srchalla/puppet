File_line {
  path => '/etc/ssh/sshd_config',
}

file_line { 'PermitRootYes':
  line  => 'PermitRootLogin yes',
  match => '^PermitRootLogin\s+[a-z]',
}
file_line { 'clean':
  ensure            => 'absent',
  match_for_absence => true,
  replace           => false,
  match             => '^$|^#',
  multiple          => true,
}
