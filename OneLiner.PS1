 
enable TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 
One-Line Script
ICM $([scriptblock]::Create((wget "https://raw.githubusercontent.com/PSScript/PS/main/GroupSubscribe.PS1").Content))
 
Web View
https://raw.githubusercontent.com/PSScript/PS/main/GroupSubscribe.PS1