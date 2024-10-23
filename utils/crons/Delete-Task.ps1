Param (
  [string]
  $TaskName = "ScheduledTask"
)

$TaskCommand = @"
schtasks /delete /tn "$TaskName"
"@

Write-Host "Deleting task '$TaskName'..."
Invoke-Expression $TaskCommand
