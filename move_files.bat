@echo off
set DOWNLOADS=C:\Users\Mecha\Downloads
set ARCHIVED=%DOWNLOADS%\Archived
set TOBEDELETED=%DOWNLOADS%\ToBeDeleted

:: Create folders if they don't exist
if not exist "%ARCHIVED%" mkdir "%ARCHIVED%"
if not exist "%TOBEDELETED%" mkdir "%TOBEDELETED%"

echo Moving FILES older than 7 days to Archived...
forfiles /p "%DOWNLOADS%" /m *.* /d -2 /c "cmd /c if @isdir==FALSE move @path \"%ARCHIVED%\""

echo Moving FOLDERS older than 7 days to Archived...
for /d %%F in ("%DOWNLOADS%\*") do (
    if /i not "%%~nxF"=="Archived" (
        if /i not "%%~nxF"=="ToBeDeleted" (
            forfiles /p "%%F" /d -2 /c "cmd /c exit 0" >nul 2>&1
            if not errorlevel 1 (
                echo Moving folder: %%F
                move "%%F" "%ARCHIVED%"
            )
        )
    )
)

echo Moving FILES older than 3 days in Archived to ToBeDeleted...
forfiles /p "%ARCHIVED%" /m *.* /d -3 /c "cmd /c if @isdir==FALSE move @path \"%TOBEDELETED%\""

echo Moving FOLDERS older than 3 days in Archived to ToBeDeleted...
for /d %%F in ("%ARCHIVED%\*") do (
    if /i not "%%~nxF"=="ToBeDeleted" (
        forfiles /p "%%F" /d -3 /c "cmd /c exit 0" >nul 2>&1
        if not errorlevel 1 (
            echo Moving folder: %%F
            move "%%F" "%TOBEDELETED%"
        )
    )
)

echo Done!
pause
