concat { '/etc/motd' :
  ensure         => present,
  ensure_newline => true,
}

concat::fragment { 'main_content':
  target  => '/etc/motd',
  content => 'This is a corporate server - authorized logins only',
  order   => '01',
}
concat::fragment { 'dept_content':
  target  => '/etc/motd',
  content => 'Only for dbadmins',
  order   => '05',
}
concat::fragment { 'local_content':
  target => '/etc/motd',
  order  => '11',
  source => 'file:///etc/motd.local',
}
