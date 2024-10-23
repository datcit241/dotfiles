Param (
  [string]
  $NotificationTaskName = "ShutdownWarningNotification",

  [string]
  $ShutdownTaskName = "Shutdown"
)

$DeleteTasksScriptPath = [System.IO.Path]::Combine($CurrentDir, "Delete-Task.ps1")

powershell.exe -ExecutionPolicy Bypass -File $DeleteTasksScriptPath -TaskName $NotificationTaskName
Write-Host "####################################################################################################"
powershell.exe -ExecutionPolicy Bypass -File $DeleteTasksScriptPath -TaskName $ShutdownTaskName
