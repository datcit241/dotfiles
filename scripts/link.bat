@echo off
set homeDir=%HOMEDRIVE%%HOMEPATH%
set /p sourceDir=Enter source path: 
set /p destDir=Enter destination path: 

set suffix=
set suffixNum=1

:check_backup
if exist "%destDir%%suffix%" (
    if "!suffix!"=="" (
        echo Initial backup suffix set to _bak
        set suffix=_bak
    ) else (
        echo Incrementing backup suffix
        set /a suffixNum+=1
        set suffix=_bak%suffixNum%
    )
    goto check_backup
)

echo Rename the existing nvim directory to the backup name %destDir%%suffix%
if exist "%destDir%" (
    powershell -Command "Rename-Item -Path '%destDir%' -NewName '%destDir%%suffix%'"
)

echo Create the new symbolic link
powershell -Command "New-Item -ItemType SymbolicLink -Path '%destDir%' -Target '%sourceDir%'"
