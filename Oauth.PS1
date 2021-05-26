Oauth Test Cloud - quick check ONLY
============================================================
    $CloudMailbox = $((Get-Mailbox | where {$_.isdirsynced -eq 'true' })[-1].primarysmtpaddress) ;  $CloudMailbox
  $EwsEndpointURI = "https://$((Get-MigrationEndpoint | ? {$_.identity -match "Hybrid"})[-1].remoteserver)/ews/exchange.asmx"; $EwsEndpointURI
$AutoddiscoverURI = $((Get-IntraOrganizationConnector)[-1].DiscoveryEndpoint.AbsoluteUri) ; $AutoddiscoverURI
Test-OAuthConnectivity -Service EWS -TargetUri $EwsEndpointURI -Mailbox $CloudMailbox -Verbose | fl
Test-OAuthConnectivity -Service AutoD -TargetUri $AutoddiscoverURI -Mailbox $CloudMailbox -Verbose | fl

============================================================

# enable TLS 1.2 in session if needed
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

============================================================

OAUTH-LOGS  - (please get LOGS below)

# onprem 

Powershell (automatic oneliner)
ICM $([scriptblock]::Create([System.Text.Encoding]::ASCII.GetString((wget "https://jahube.github.io/Onprem.PS1").Content)))

Web view (manual/same)
https://github.com/jahube/Oauth/blob/main/LOGS-Onprem.PS1

============================================================

# Cloud

Powershell (automatic oneliner)
ICM $([scriptblock]::Create([System.Text.Encoding]::ASCII.GetString((wget "https://jahube.github.io/EXO.PS1").Content)))

Web view (manual/same)
https://github.com/jahube/Oauth/blob/main/LOGS-ExchangeOnline.PS1

=============================================================

AFTER
	
Autodiscover Test ("Outlook" to diagnose autodiscover behavior) - EXPAND + save as HTML

https://testconnectivity.microsoft.com/tests/Ola/input