each ( $facts['partitions'] ) | $devname, $devprops | {
  if $devprops['mount'] {
    notify { "Dev: ${devname} is ${devprops['size']}": }
  }
}
