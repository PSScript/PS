IF (get-installedmodule AzureAD -EA SilentlyContinue) { Uninstall-Module AzureAD -Force }
IF (!(get-installedmodule AzureADPreview)) {
  Try { Install-Module AzureADPreview -Repository 'PSGallery' -Force -CF:$false -EA stop } 
catch {  Install-Module AzureADPreview -Repository 'PSGallery' -Force -Scope CurrentUser } }
IF(!@(Get-PSSession | where { $_.State -ne "broken" } )) {
IF(!@(Get-InstalledModule ExchangeOnlineManagement -ErrorAction SilentlyContinue)) { install-module exchangeonlinemanagement -Scope CurrentUser }

IF(!@($Credentials)) {$Credentials = Get-credential } ; IF(!@($ADMIN)) {$ADMIN = $Credentials.UserName }
Try { Connect-ExchangeOnline -Credential $Credentials -EA stop } catch { Connect-ExchangeOnline -UserPrincipalName $ADMIN } }
