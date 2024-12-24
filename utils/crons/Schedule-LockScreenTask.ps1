Param (
  [string]
  $Time = "12:00",

  [string]
  $NotificationTaskName = "LockScreenWarningNotification",

  [string]
  $LockScreenTaskName = "LockScreen",

  [string]
  $ScheduleType = "DAILY"
)

$CurrentDir = (Get-Location).Path

$ScheduleTaskScriptPath = [System.IO.Path]::Combine($CurrentDir, "Schedule-Task.ps1")

$NotificationScriptPath = [System.IO.Path]::Combine($CurrentDir, "Show-Notification.ps1")
$NotificationTitle = "Warning!!!"
$NotificationText = "Windows will lock in less than 5 minutes"
$NotificationExpression = "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File '$NotificationScriptPath' -Title '$NotificationTitle' -Text '$NotificationText'"

$NotificationStartTime = [datetime]::ParseExact($Time, "HH:mm", $null).AddMinutes(-5).ToString("HH:mm") # 5 minutes before screen being locked

$LockScreenExpression = "rundll32.exe user32.dll,LockWorkStation"

powershell.exe -ExecutionPolicy Bypass -File $ScheduleTaskScriptPath -TaskName $NotificationTaskName -TaskRun $NotificationExpression -Time $NotificationStartTime -ScheduleType $ScheduleType
Write-Host "####################################################################################################"
powershell.exe -ExecutionPolicy Bypass -File $ScheduleTaskScriptPath -TaskName $LockScreenTaskName -TaskRun $LockScreenExpression -Time $Time -ScheduleType $ScheduleType
