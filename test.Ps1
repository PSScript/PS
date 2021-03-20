IF (get-installedmodule AzureAD -EA SilentlyContinue) { Uninstall-Module AzureAD -Force }
IF (!(get-installedmodule AzureADPreview)) {
  Try { Install-Module AzureADPreview -Repository 'PSGallery' -Force -CF:$false -EA stop } 
catch {  Install-Module AzureADPreview -Repository 'PSGallery' -Force -Scope CurrentUser } }
