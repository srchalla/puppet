$ntp_conf = '# THis file is managed by Puppet
Server 192.168.1.74 iburst
driftfile /var/lib/ntp/drift
'

package { 'ntp':
  ensure => present,
  before => File['/etc/ntp.conf'],
}

file { '/etc/ntp.conf':
  ensure  => 'file',
  content => $ntp_conf,
  owner   => 'root',
  group   => 'wheel',
  mode    => '0660',
  require => Package['ntp'],              # Above package should be installed before we this file configured
}

service { 'NTP_Service':
  ensure    => 'running',
  enable    => 'true',
  name      => 'ntpd',
  subscribe => File['/etc/ntp.conf']     # Subcribed for updates from above File Resource
}

