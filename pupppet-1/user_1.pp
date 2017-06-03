user { 'schalla':
  ensure     => 'present',
  managehome => true,
  groups     => ['wheel', 'users'],
  password   => pw_hash('Top$ecret1', 'SHA-512', 'random'),
}

  
