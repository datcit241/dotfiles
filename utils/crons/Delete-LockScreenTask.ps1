Param (
  [string]
  $NotificationTaskName = "LockScreenWarningNotification",

  [string]
  $LockScreenTaskName = "LockScreen"
)

$DeleteTasksScriptPath = [System.IO.Path]::Combine($CurrentDir, "Delete-Task.ps1")

powershell.exe -ExecutionPolicy Bypass -File $DeleteTasksScriptPath -TaskName $NotificationTaskName
Write-Host "####################################################################################################"
powershell.exe -ExecutionPolicy Bypass -File $DeleteTasksScriptPath -TaskName $LockScreenTaskName
