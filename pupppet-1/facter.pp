###########################################################################
#  
# What's this?    : Using System Facts in Puppet Code
#
# Who Documented  : Srinath Challa
#
# When its update : 6/3/2017
#
###########################################################################

$display = @("START")
Family : ${facts['os']['family']}
OS     : ${facts['os']['name']}
Version: ${facts['os']['release']['full']}
START

notify { $display: }
