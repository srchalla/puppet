$motd = @(END)
Welcome to the server: <%= $facts['networking']['fqdn'] %>
The server will be shutdown today at: <%= $down_time %>
END

file { '/etc/motd':
  ensure  => 'file',
  content =>  inline_epp($motd, { 'down_time' => '17:01',} ),
}
