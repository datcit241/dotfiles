@echo off
set homeDir=%HOMEDRIVE%%HOMEPATH%
set targetDir=.\config\
set backupDir=%homeDir%\AppData\Local\nvim

set suffix=
set suffixNum=1

:check_backup
if exist "%backupDir%%suffix%" (
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

echo Rename the existing nvim directory to the backup name %backupDir%%suffix%
if exist "%backupDir%" (
    powershell -Command "Rename-Item -Path '%backupDir%' -NewName '%backupDir%%suffix%'"
)

echo Create the new symbolic link
powershell -Command "New-Item -ItemType SymbolicLink -Path '%homeDir%\AppData\Local\nvim' -Target '%targetDir%'"
