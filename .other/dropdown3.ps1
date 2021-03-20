#sources:http://www.powershell.nu/2009/01/21/dropdown-menu-using-windowsforms/# Edit This item to change the DropDown Values
#https://social.technet.microsoft.com/Forums/windowsserver/en-US/f570857f-7152-46d2-897a-e84f80b12a1e/powershell-gui-menu-drop-down-list-and-args-variable?forum=winserverpowershell

[array]$DropDownArray = "ping", "traceroute", "nslookup"

# This Function Returns the Selected Value and their actions then Closes the Form
function Return-DropDown {

	$Choice = $DropDown.SelectedItem.ToString()
	$Form.Close()
        if ($choice -eq "ping") 
        {
            write-host "PING $args"
            .\ping.exe $args            write-host $args        
        }
        elseif ($choice -eq "traceroute") 
        {
            write-host "TRACEROUTE $args"
            .\tracert $args
            write-host
        }

        elseif ($choice -eq "nslookup") 
        {
            write-host "NSLOOKUP $args"
            .\nslookup $args
            write-host
        }    	
}
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")


$Form = New-Object System.Windows.Forms.Form
$Form.width = 300
$Form.height = 150
$Form.Text = ”$args - Network Tools”

$DropDown = new-object System.Windows.Forms.ComboBox
$DropDown.Location = new-object System.Drawing.Size(100,10)
$DropDown.Size = new-object System.Drawing.Size(130,30)

ForEach ($Item in $DropDownArray) {
	$DropDown.Items.Add($Item)
}

$Form.Controls.Add($DropDown)

$DropDownLabel = new-object System.Windows.Forms.Label
$DropDownLabel.Location = new-object System.Drawing.Size(10,10)
$DropDownLabel.size = new-object System.Drawing.Size(100,20)
$DropDownLabel.Text = $args
$Form.Controls.Add($DropDownLabel)

$Button = new-object System.Windows.Forms.Button
$Button.Location = new-object System.Drawing.Size(100,50)
$Button.Size = new-object System.Drawing.Size(100,20)
$Button.Text = "OK"
$Button.Add_Click({Return-DropDown})
$form.Controls.Add($Button)

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()