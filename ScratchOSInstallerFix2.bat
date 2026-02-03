@echo off
title Scratch OS Installer - Superchavo
cls

echo ================================
echo   Scratch OS Installer
echo        by Superchavo
echo ================================
echo.

:: Windows 7 compatible admin check
echo Checking for administrator rights...
net session >nul 2>&1
if %errorLevel% neq 0 (
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
echo.

:: WINDOWS 7 FIX: Create user in two steps
net user "Scratch Cat" DaCat /add /fullname:"Scratch Cat" 2>nul
if errorlevel 1 (
    echo [!] User "Scratch Cat" may already exist.
    goto setpassword
)

echo [OK] User created successfully.

:setpassword
:: Set/change password separately
net user "Scratch Cat" DaCat 2>nul
echo [OK] Password set to: DaCat

:: Add to administrators - Windows 7 compatible
net localgroup administrators "Scratch Cat" /add 2>nul
if errorlevel 1 (
    echo [!] Note: User may already be in admin group.
) else (
    echo [OK] Added to Administrators group.
)

echo.
echo Opening download pages...
echo Please wait for browser to open...
echo.

:: Open downloads with delays
start "" "https://www.mediafire.com/view/mkqeejm21fzx6bt/images.jpeg/file"
ping -n 4 127.0.0.1 >nul

start "" "https://www.mediafire.com/view/v2o6i0yovdxobat/NewProject8svg2.png/file"
ping -n 4 127.0.0.1 >nul

start "" "https://www.mediafire.com/file/lsawb6ksj0636h3/Cursorz.zip/file?dkey=mydw8l5jt4c&r=1835"

echo.
echo ================================
echo      INSTALLATION COMPLETE
echo ================================
echo.
echo Summary:
echo - User: Scratch Cat
echo - Password: DaCat
echo - Account type: Administrator
echo.
echo Save downloads to:
echo C:\Users\Scratch Cat\
echo.
echo Press any key to exit...
pause >nul
