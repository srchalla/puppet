$display = @("END")

Family: ${facts['os']['family']}
OS: ${facts['os']['name']}
Version: ${facts['os']['release']['full']}
END

notify { $display : }
