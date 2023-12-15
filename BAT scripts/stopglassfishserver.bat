@echo off
:: Check for administrator rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    goto :run_as_admin
) || (
    echo Administrator rights are required to run this script.
    goto :eof
)

:run_as_admin

set GLASSFISH_HOME="C:\glassfish-4.1.2\glassfish4\glassfish\domains\domain1"

:: Stop GlassFish server
%GLASSFISH_HOME%\bin\asadmin stop-domain

:: Wait for GlassFish to stop 
timeout /t 10

echo GlassFish server has been stopped.

pause
