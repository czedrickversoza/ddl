@echo off

setlocal EnableDelayedExpansion

:: Extract year, month, and day from the system's date
set YEAR=%DATE:~10,4%
set MONTH=%DATE:~4,2%
set DAY=%DATE:~7,2%

:: Ensure month and day are two digits (add leading zero if necessary)
if %MONTH% LSS 10 set MONTH=0%MONTH:~1,1%
if %DAY% LSS 10 set DAY=0%DAY:~1,1%

:: Extract hour, minute, and second from the system's time
set HOUR=%TIME:~0,2%
set MINUTE=%TIME:~3,2%
set SECOND=%TIME:~6,2%

:: Ensure hour, minute, and second are two digits (add leading zero if necessary)
if %HOUR% LSS 10 set HOUR=0%HOUR:~1,1%
if %MINUTE% LSS 10 set MINUTE=0%MINUTE:~1,1%
if %SECOND% LSS 10 set SECOND=0%SECOND:~1,1%

:: Create a log file with the current timestamp in its name
set FILENAME= %COMPUTERNAME%_WIFI_%YEAR%-%MONTH%-%DAY%_%HOUR%-%MINUTE%-%SECOND%.txt

get_wifi.bat > %FILENAME%

timeout /t 3 > NUL
drop.bat %FILENAME%



