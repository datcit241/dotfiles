Param (
  [string]
  $Time = "21:30",

  [string]
  $NotificationTaskName = "ShutdownWarningNotification",

  [string]
  $ShutdownTaskName = "Shutdown",

  [string]
  $ScheduleType = "DAILY"
)

$CurrentDir = (Get-Location).Path

$ScheduleTaskScriptPath = [System.IO.Path]::Combine($CurrentDir, "Schedule-Task.ps1")

$NotificationScriptPath = [System.IO.Path]::Combine($CurrentDir, "Show-Notification.ps1")
$NotificationTitle = "Warning!!!"
$NotificationText = "Windows will shutdown in less than 5 minutes"
$NotificationExpression = "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File '$NotificationScriptPath' -Title '$NotificationTitle' -Text '$NotificationText'"

$NotificationStartTime = [datetime]::ParseExact($Time, "HH:mm", $null).AddMinutes(-5).ToString("HH:mm") # 5 minutes before shutting down

$ShutdownExpression = "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -Command 'Stop-Computer -Force'"

powershell.exe -ExecutionPolicy Bypass -File $ScheduleTaskScriptPath -TaskName $NotificationTaskName -TaskRun $NotificationExpression -Time $NotificationStartTime -ScheduleType $ScheduleType
Write-Host "####################################################################################################"
powershell.exe -ExecutionPolicy Bypass -File $ScheduleTaskScriptPath -TaskName $ShutdownTaskName -TaskRun $ShutdownExpression -Time $Time -ScheduleType $ScheduleType
