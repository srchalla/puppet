File {
  ensure => 'file',
  owner  => 'schalla',
  group  => 'sysadmins',
  mode   => '0664',
}

file { '/tmp/schalla':
  ensure => 'directory',
}

file { '/tmp/schalla/file1': }
file { '/tmp/schalla/file2': }
file { '/tmp/schalla/file3':
  owner => 'root',
  group => 'root',
  mode  => '0770',
}
