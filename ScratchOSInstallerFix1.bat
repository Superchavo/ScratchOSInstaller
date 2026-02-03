@echo off
title Scratch OS Installer - Superchavo
cls

echo ================================
echo   Scratch OS Installer
echo        by Superchavo
echo ================================
echo.

echo Checking for administrator rights...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if errorlevel 1 (
    echo ERROR: Please run as Administrator!
    echo.
    echo Right-click this file and select:
    echo "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo Admin rights confirmed.
echo.

:ask
set /p "install=Install Scratch OS? (Y/N): "
if /i "%install%"=="Y" goto install
if /i "%install%"=="N" exit
goto ask

:install
echo.
echo Creating user "Scratch Cat"...

net user "Scratch Cat" DaCat /add /fullname:"Scratch Cat" /comment:"Scratch User" >nul 2>&1
if errorlevel 1 (
    echo User may already exist. Setting password...
) else (
    echo User created successfully.
)

net user "Scratch Cat" DaCat >nul 2>&1
echo Password set to: DaCat

net localgroup administrators "Scratch Cat" /add >nul 2>&1
if errorlevel 1 (
    echo Note: Could not add to admin group (may already be admin).
) else (
    echo Added to Administrators group.
)

echo.
echo Opening download pages...
echo.

start "" "https://www.mediafire.com/view/mkqeejm21fzx6bt/images.jpeg/file"
ping -n 3 127.0.0.1 >nul

start "" "https://www.mediafire.com/view/v2o6i0yovdxobat/NewProject8svg2.png/file"
ping -n 3 127.0.0.1 >nul

start "" "https://www.mediafire.com/file/lsawb6ksj0636h3/Cursorz.zip/file?dkey=mydw8l5jt4c&r=1835"

echo.
echo ================================
echo      INSTALLATION COMPLETE
echo ================================
echo.
echo User account ready:
echo - Username: Scratch Cat
echo - Password: DaCat
echo - Type: Administrator
echo.
echo Download instructions:
echo 1. Download files from browser tabs
echo 2. Save to: C:\Users\Scratch Cat\
echo 3. Extract Cursorz.zip if needed
echo.
echo Created by Superchavo
echo.
pause
