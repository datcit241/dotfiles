Param (
  [string]
  $TaskName = "ScheduledNotification"
)

$DeleteTasksScriptPath = [System.IO.Path]::Combine($CurrentDir, "Delete-Task.ps1")

powershell.exe -ExecutionPolicy Bypass -File $DeleteTasksScriptPath -TaskName $TaskName
