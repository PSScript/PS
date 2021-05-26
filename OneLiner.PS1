Group Subscribe

enable TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 
One-Line Script
ICM $([scriptblock]::Create((wget "https://raw.githubusercontent.com/PSScript/PS/main/GroupSubscribe.PS1").Content))
 
Web View
https://raw.githubusercontent.com/PSScript/PS/main/GroupSubscribe.PS1

========================================================================================================================

OWA clear cache

# TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Powershell direct
ICM $([scriptblock]::Create((wget "https://raw.githubusercontent.com/PSScript/PS/main/OWA-suggestedContacts.PS1").Content))

web view
https://raw.githubusercontent.com/PSScript/PS/main/OWA-suggestedContacts.PS1