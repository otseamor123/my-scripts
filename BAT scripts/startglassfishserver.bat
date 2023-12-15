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

:: Start GlassFish server
%GLASSFISH_HOME%\bin\asadmin start-domain

:: Wait for GlassFish to start
timeout /t 10

echo GlassFish server has started.

pause
