class role::lampserver {
  include profile::apache
  include profile::php
  include profile::mysql
}
