###################################################
#  
# What's this?    : 
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
###################################################

each ( $facts['partitions'] ) | $devname, $devprops | {
  if $devprops['mount'] {
    notify { "Dev: ${devname} is ${devprops['size']}": }
  }
}
