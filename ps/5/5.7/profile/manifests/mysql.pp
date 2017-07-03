class profile::mysql {
  class { 'mysql::server':
    root_password           => 'Password1',
    remove_default_accounts => true,
  }
  include mysql::client
}
