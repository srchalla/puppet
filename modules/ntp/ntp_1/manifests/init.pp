#############################################################################
#  
# What's this?    : Took ntp_final.pp file in puppet_basics and created modules
#                   and classes.
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
#############################################################################
class ntp {
  package { 'ntp':	  
    ensure => 'present',
    before => Class['ntp::config'],
  }
  include ntp::config
  include ntp::service
}
