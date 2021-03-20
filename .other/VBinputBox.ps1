#https://stackoverflow.com/questions/37555109/powershell-input-box-with-multiple-inputfields
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Demographics'
$msg   = 'Enter your demographics:'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)


function askforinfo {
    param (
        [string]$Demographics,
        [validateset(1, 2, 3)]
        [string]$otherstuff
    )
    [pscustomobject]@{
        Demographics = $Demographics
        OtherStuff = $otherstuff
    }
}

$result = Invoke-Expression (Show-Command askforinfo -PassThru)

$result