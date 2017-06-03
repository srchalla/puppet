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
  notify  => Service['NTP_Service'],
}

service { 'NTP_Service':
  ensure => 'running',
  enable => 'true',
  name   => 'ntpd',
}

