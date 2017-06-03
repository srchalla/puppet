$ntp_conf = @(END) 
# Managed by Puppet
Server 192.168.1.74 iburst
driftfile /var/lib/ntp/drift
END 

$admin_group = 'weeh'
$ntp_service = 'ntpd'

package { 'ntp':
  ensure => present,
}

file { '/etc/ntp.conf':
  ensure  => 'file',
  content => $ntp_conf,
  owner   => 'root',
  group   => 'wheel',
  mode    => '0660',
}

service { $ntp_service:
  ensure => 'running',
  enable => 'true',
  #name   => 'ntpd'
}

