# Variables
$ntp_service = 'ntpd'
notify { $ntp_service: }
notify { "The ${ntp_service} is running": }

# Arrays
$admingroups = [ 'wheel', 'sysadmins', true, 123]
notify { "The group is ${admingroups[0]}": }

# Hash Arrays
$user = {
  username => 'schalla',
  uid      => '9999',
}

notify { $user['username']: }
notify { "The user is ${user['username']} ": }
notify { "The UID of ${user['username']} is ${user['uid']}": }

#Tip: You cannot re-assign variable in puppet
#$ntp_service = 'ntp'

