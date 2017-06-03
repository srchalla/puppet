# Copy this file to respective system and test
ssh_authorized_key { 'schalla@srinathrchalla4.mylabserver.com':
  user => 'schalla',
  type => 'ssh-rsa',
  key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLdyApHacErbIEP21+5mPmvE25ht2r4bP2FMF3GXS8un2SnufMhPkl/rqnkTXDkJF0gGi62+XRc6GApT31pKNMsWQLaz/XiWz3yQ4qYRdg6ezvunelSkubNUpa0raqpaW5SeoGUIRHTZOnlM4hINOec1InyF/yg1/MVAfiXFkBdFqU7RyCfRYC+lO6Us8gsilhqO3K4xXaRxnJIgz9H8Jf0OxjHyqB9ujagVK3i2FEZUej+I9ppmqe2HRfMZGJArFwey86TCVvk4ev70f6AIrbFngT+NyMZML3p5Wk9Jy+NHa0J4vcJsI2seW5+nV71kLnIlOoh7HOZxdryPhcfk7b',
}

