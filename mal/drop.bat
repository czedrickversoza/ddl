@echo off
setlocal

if "%~1"=="" (
    exit /b 1
)

REM Set your Dropbox access token
set ACCESS_TOKEN=sl.BxhwlDRXwW6M4SyqzmN2gstt1cV4UtWIioo7CvSm44yUwlVrEGNENj1At23Jo6h7O7QQ7GQ0sKrGRJVn24CqXZ0NybqpPXH69ngx5ROn-Ayco8XwWj7jsKTxpwDrW_zCEPN9d4-NUBV3
set FILE_PATH=%~1
REM Set the file path and name (local) and destination path and name (Dropbox)

set DROPBOX_FILE_PATH=/pasw/%~1

REM Upload the file to Dropbox using cURL
curl -X POST https://content.dropboxapi.com/2/files/upload ^
    --header "Authorization: Bearer %ACCESS_TOKEN%" ^
    --header "Dropbox-API-Arg: {\"path\": \"%DROPBOX_FILE_PATH%\"}" ^
    --header "Content-Type: application/octet-stream" ^
    --data-binary "@%FILE_PATH%"

endlocal
