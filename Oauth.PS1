OAUTH-LOGS  - please get LOGS below

#  To  enable TLS 1.2 in Powershell session
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12    

# onprem 

Powershell (automatic oneliner)
ICM $([scriptblock]::Create([System.Text.Encoding]::ASCII.GetString((wget "https://jahube.github.io/Onprem.PS1").Content)))

Web view (manual/same)
https://github.com/jahube/Oauth/blob/main/LOGS-Onprem.PS1

#######################################################

# Cloud

Powershell (automatic oneliner)
ICM $([scriptblock]::Create([System.Text.Encoding]::ASCII.GetString((wget "https://jahube.github.io/EXO.PS1").Content)))

Web view (manual/same)
https://github.com/jahube/Oauth/blob/main/LOGS-ExchangeOnline.PS1

#######################################################

Autodiscover Test - EXPAND + save as HTML

https://testconnectivity.microsoft.com/tests/Ola/input

#######################################################

Oauth Cloud - quick check

    $CloudMailbox = $((Get-Mailbox | where {$_.isdirsynced -eq 'true' })[-1].primarysmtpaddress) ;  $CloudMailbox
  $EwsEndpointURI = "https://$((Get-MigrationEndpoint | ? {$_.identity -match "Hybrid"})[-1].remoteserver)/ews/exchange.asmx"; $EwsEndpointURI
$AutoddiscoverURI = $((Get-IntraOrganizationConnector)[-1].DiscoveryEndpoint.AbsoluteUri) ; $AutoddiscoverURI
Test-OAuthConnectivity -Service EWS -TargetUri $EwsEndpointURI -Mailbox $CloudMailbox -Verbose | fl
Test-OAuthConnectivity -Service AutoD -TargetUri $AutoddiscoverURI -Mailbox $CloudMailbox -Verbose | fl

#######################################################

Oauth Onprem - quick check

$OnpremMailbox = "$((Get-Mailbox | Where-Object {$_.MailboxMoveRemoteHostName -like "*.onmicrosoft.com"})[-1].UserPrincipalname)"
Test-OAuthConnectivity -Service EWS -TargetUri https://outlook.office365.com/ews/exchange.asmx -Mailbox $OnpremMailbox -Verbose | fl
Test-OAuthConnectivity -Service AutoD  -TargetUri https://autodiscover-s.outlook.com/autodiscover/autodiscover.svc -Mailbox $OnpremMailbox -Verbose | fl
