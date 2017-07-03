$down_time = '23:00'
$motd = @(END)
Welcome to the server: <%= @facts['networking']['fqdn'] %>
The server will be shutdown today at: <%= @down_time %>
END

file { '/etc/motd':
  ensure  => 'file',
  content => inline_template($motd),
}
