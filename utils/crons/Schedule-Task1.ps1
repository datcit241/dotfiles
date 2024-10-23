Param (
  [string]
  $Time = (Get-Date).AddMinutes(1).ToString("HH:mm"), # 1 minute from now

  [string]
  $TaskName = "ScheduledTask",

  [string]
  $TaskRun = "powershell.exe",

  [string]
  $ScheduleType = "ONCE"
)

# Check if the task already exists
$TaskExists = schtasks /query /tn $TaskName

if ($TaskExists)
{
  # Modify the existing task
  $TaskCommand = @"
schtasks /change /tn "$TaskName" /tr "$TaskRun" /st $Time
"@
  Write-Host "Modifying existing task '$TaskName'..."
} else
{
  # Create a new task
  $TaskCommand = @"
schtasks /create /tn "$TaskName" /tr "$TaskRun" /sc $ScheduleType /st $Time /f
"@
  Write-Host "Creating new task '$TaskName'..."
}

# Execute the command to schedule or modify the task
Invoke-Expression $TaskCommand

# Query the task
schtasks.exe /query /tn $TaskName
