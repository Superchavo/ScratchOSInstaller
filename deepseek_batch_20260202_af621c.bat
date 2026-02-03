@echo off
title Scratch OS Installer by Superchavo
color 0A

echo ========================================
echo    Scratch OS Installer by Superchavo
echo ========================================
echo.

:: Windows version check - Allow 6.1 (Win7), 6.2 (Win8), 6.3 (Win8.1), and 10.*
for /f "tokens=4-5 delims=[.] " %%i in ('ver') do set _version=%%i.%%j
echo Detected Windows version: %_version%

:: Check if version is NOT in the allowed list (simplified check for major versions 6 and 10)
echo %_version% | findstr /r "^6\.[123] ^10\." > nul
if %errorLevel% neq 0 (
    echo.
    echo [!] This script is configured for Windows 7, 8, 8.1, and 10.
    echo     Your version (%_version%) may not be fully supported.
    choice /c YN /m "Do you want to try to continue anyway? (Y/N)"
    if errorlevel 2 (
        echo Installation cancelled.
        pause
        exit /b
    )
)
echo Windows version check passed.
echo.

:: Check for admin rights
NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    echo.
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs" 2>nul
    if errorlevel 1 (
        echo Could not elevate privileges.
        echo Please right-click this file and select "Run as administrator".
        pause
    )
    exit /b
)

echo Running as Administrator...
echo.

:: Installation prompt
set /p install="Install Scratch OS? (Y/N): "
if /i "%install%" neq "Y" (
    echo Installation cancelled by user.
    pause
    exit /b
)

echo.
echo Creating user 'Scratch Cat' with administrator privileges...

:: Create the user with password 'DaCat'
net user "Scratch Cat" DaCat /add /comment:"Scratch OS User" /fullname:"Scratch Cat" /active:yes 2>nul
if %errorLevel% equ 0 (
    echo [✓] User 'Scratch Cat' created successfully.
    echo [✓] Password has been set to: DaCat
    
    :: Add to administrators group
    net localgroup administrators "Scratch Cat" /add 2>nul
    if %errorLevel% equ 0 (
        echo [✓] User added to Administrators group.
    ) else (
        echo [!] Could not add to Administrators group.
        echo    You may need to add manually via Computer Management.
    )
    
) else (
    echo [!] Failed to create user. 'Scratch Cat' might already exist.
)

echo.
echo ========================================
echo Opening download pages in your browser...
echo ========================================
echo.
echo Please save these files to: C:\Users\Scratch Cat\
echo.

:: Open each URL in default browser
echo 1. Opening images.jpeg...
start "" "https://www.mediafire.com/view/mkqeejm21fzx6bt/images.jpeg/file"
timeout /t 3 >nul

echo 2. Opening NewProject8svg2.png...
start "" "https://www.mediafire.com/view/v2o6i0yovdxobat/NewProject8svg2.png/file"
timeout /t 3 >nul

echo 3. Opening Cursorz.zip...
start "" "https://www.mediafire.com/file/lsawb6ksj0636h3/Cursorz.zip/file?dkey=mydw8l5jt4c&r=1835"

echo.
echo ========================================
echo Summary:
echo ========================================
echo 1. User 'Scratch Cat' created (Password: DaCat)
echo 2. Browser opened with 3 download pages.
echo.
echo Instructions:
echo 1. Download all files from the browser tabs.
echo 2. Save files to: C:\Users\Scratch Cat\
echo.
echo Created by: Superchavo
echo ========================================
echo.
pause