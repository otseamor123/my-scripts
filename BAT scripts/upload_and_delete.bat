@echo off
setlocal enabledelayedexpansion


set AWS_BUCKET_NAME=nibss-logs-backup
set LOCAL_LOG_PATH=C:\glassfish-4.1.2\glassfish4\glassfish\domains\domain1\config\log4j-application.log

:: Upload the log file to S3
aws s3 cp "%LOCAL_LOG_PATH%" s3://%AWS_BUCKET_NAME%/

:: Check if the upload was successful
if errorlevel 1 (
    echo Error uploading the log file to S3.
) else (
    echo Log file uploaded successfully to S3.

    :: Delete the local log file
    del "%LOCAL_LOG_PATH%"
    echo Local log file deleted.
)

endlocal
