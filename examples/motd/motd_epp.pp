$motd = @(END)
Welcome to the server <%= $facts['networking']['fqdn'] %>
The server will be going down today at <%= $downtime %>
END

file { '/etc/motd':
  ensure  => 'file',
  content =>  inline_epp($motd, { 'downtime' => '18:00'},),
}

