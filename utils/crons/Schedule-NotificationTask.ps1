Param (
  [string]
  $Time = (Get-Date).AddMinutes(1).ToString("HH:mm"), # 1 minute from now

  [string]
  $TaskName = "ScheduledNotification",

  [string]
  $Title = "Reminder",

  [string]
  $Text = "This is your scheduled notification.",

  [string]
  $ScheduleType = "ONCE"
)

$CurrentDir = (Get-Location).Path

$ScheduleTaskScriptPath = [System.IO.Path]::Combine($CurrentDir, "Schedule-Task.ps1")

$ScriptPath = [System.IO.Path]::Combine($CurrentDir, "Show-Notification.ps1")
$TaskRun = "powershell.exe -WindowStyle Hidden -NonInteractive -ExecutionPolicy Bypass -File '$ScriptPath' -Title '$Title' -Text '$Text'"

powershell.exe -ExecutionPolicy Bypass -File $ScheduleTaskScriptPath -TaskName $TaskName -TaskRun $TaskRun -Time $Time -ScheduleType $ScheduleType
