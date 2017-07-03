class centos_repo {

  file { '/etc/yum.repos.d/' :
    ensure  => 'present',
    source  => 'puppet:///modules/centos_repo/repos',
    recurse => true,
    purge   => true,
  }
}
