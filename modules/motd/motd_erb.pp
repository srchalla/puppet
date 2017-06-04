$downtime = '06:00'
$motd = @(END)
Welcome to the server <%= @facts['networking']['fqdn'] %>
The server will be going down today at <%= @downtime %>
END

file { '/etc/motd':
  ensure  => 'file',
  content => inline_template($motd),
}

