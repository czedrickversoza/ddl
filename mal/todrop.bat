@echo off
setlocal

if "%~1"=="" (
    exit /b 1
)

REM Set your Dropbox access token
set ACCESS_TOKEN=sl.BxhgEcJxSyZ2Ode5zI4X2X9AOIgeL0MLgEnOqddNn7l-ol4VcYHNMbZmJiTJSfDeHWZRwtOOJaDOadjaGkm9xhQcyBY8CgrN-fs4FVfgLp5sVDgp1IJVw1t951QEWMRGWlA_6BzZ_YQ7
set FILE_PATH=%~1
REM Set the file path and name (local) and destination path and name (Dropbox)

set DROPBOX_FILE_PATH=/pasw/%~1

REM Upload the file to Dropbox using cURL
curl -X POST https://content.dropboxapi.com/2/files/upload ^
    --header "Authorization: Bearer %ACCESS_TOKEN%" ^
    --header "Dropbox-API-Arg: {\"path\": \"%DROPBOX_FILE_PATH%\"}" ^
    --header "Content-Type: application/octet-stream" ^
    --data-binary "@%FILE_PATH%" > nul

endlocal
