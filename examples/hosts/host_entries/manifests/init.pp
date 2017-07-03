class host_entries {
  
  host { 'localhost':
    ip => '127.0.0.1',
  }
  
  host { $facts['networking']['fqdn']:
    ip           => $facts['networking']['ip'],
    host_aliases => $facts['networking']['hostname'],
  }
 
  host_entries::host_entry { 'srinathrchalla3':
    ip => '34.209.25.224',
  }

  host_entries::host_entry { 'srinathrchalla5':
    ip => '54.245.167.84'
  }

  host_entries::host_entry { 'srinathrchalla6':
    ip => '54.245.154.179'
  }

  resources { 'host':
  purge => true,
  }
}
