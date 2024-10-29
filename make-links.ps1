param (
  [string]$path
)

function Resolve-PathIfRelative
{
  param (
    [string]$basePath,
    [string]$relativePath
  )
  if (-not [System.IO.Path]::IsPathRooted($relativePath))
  {
    # Save the current directory
    $currentDir = Get-Location

    # Change to the base directory
    Set-Location -Path $basePath

    # Resolve the relative path
    $resolvedPath = Resolve-Path -Path $relativePath

    # Change back to the original directory
    Set-Location -Path $currentDir

    return $resolvedPath
  }
  return $path
}

# Check if the user provided a directory path
if (-not $path)
{
  Write-Host "Usage: .\link1.ps1 -path <path_to_directory_or_sources.json>"
  exit 1
}


if (Test-Path -Path $path -PathType Container)
{
  $path = Join-Path -Path $path -ChildPath "sources.json"
}

$currentDir = Get-Location
$path = Resolve-PathIfRelative -basePath $currentDir -relativePath $path
$sourceDir = Split-Path -Path $path -Parent

# Check if sources.json exists in the provided directory
if (-not (Test-Path -Path $path))
{
  Write-Host "Error: sources.json not found in the specified directory."
  exit 1
}

# Read and parse the JSON file
$jsonContent = Get-Content -Path $path -Raw | ConvertFrom-Json

# Create soft links for each source-destination pair
foreach ($pair in $jsonContent.win)
{
  $source = $pair[0]
  $destination = $pair[1]

  # Expand environment variables in the destination path
  $destination = [System.Environment]::ExpandEnvironmentVariables($destination)

  # Convert relative source path to absolute path
  $source = Resolve-PathIfRelative -basePath $sourceDir -relativePath $source

  # Create the soft link
  Write-Host "New-Item -ItemType SymbolicLink -Path '$destination' -Target '$source'"
  New-Item -ItemType SymbolicLink -Path $destination -Target $source
}
