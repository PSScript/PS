
$C = "Configuration\IPM.Configuration.OWA.AutocompleteCache"
$Mbxs = try { get-EXOmailbox -ResultSize unlimited } catch { get-mailbox -ResultSize unlimited }
$MBX = @($Mbxs | select use*e,disp*e,Pr*ess,distinguishedname | ogv -P -T "Select to clear Cache")
$count= $MBX.count; $Cnt = 1 ; $time = [system.diagnostics.stopwatch]::startNew() ; foreach ($M in $MBX) {
Try { Remove-MailboxUserConfiguration -Mailbox $M.distinguishedname -Identity $c -CF:$false -EA stop 
Write-Host "[Mailbox] $($M.userprincipalname) OWA Cache cleared" -F Green }catch{ $Error[0]|FL * -F} 
$Pn = $Cnt/$count ; $Pc = $Pn * 100 ; $Tsec = $time.ElapsedMilliseconds/1000;
$ts =  [timespan]::fromseconds($Tsec) ; $res = "[$('{0:d2}' -f $ts.hours):$('{0:d2}' -f $ts.minutes):$('{0:d2}' -f $ts.seconds)]"
$S =" [MBX] ($Cnt/$count)  [Time/Elapsed] $res [Total]" ; $Ttl = $Tsec/$Pn ; $Tr = $Ttl - $Tsec
$A = "Clearing OWA Autocomplete Cache [Mailbox Count] ($Cnt/$count) [Mailbox] $($M.displayname) [$($M.userprincipalname)]"
Write-Progress -Activity $A -Status $S -PercentComplete $Pc -SecondsRemaining $Tr ; $Cnt++  }
