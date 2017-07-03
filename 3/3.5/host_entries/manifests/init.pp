class host_entries {

  host { 'localhost':
    ip => '127.0.0.1',
  }

  host { $facts['networking']['fqdn'] :
    ip => $facts['networking']['ip'],
  }

  host_entries::host_entry { 'ubuntu':
    ip => '192.168.56.16',
  }
  host_entries::host_entry { 'centos7':
    ip => '192.168.56.15',
  }

  resources { 'host':
    purge => true,
  }

}
