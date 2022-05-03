@echo off

SET Releasepath=D:\WebStoreApps\WebStore
SET Backuppath=D:\AppBackups\WebStoreApps\WebStore
SET Backupcount=3

if not exist "%Releasepath%\" mkdir "%Releasepath%"
if not exist "%Backuppath%\" mkdir "%Backuppath%"

REM Dont do any changes below

SET HOUR=%time:~0,2%

SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2%
 
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

for /f "skip=%Backupcount% delims=" %%d in ('dir /ad /b /o-d /tc %Backuppath%') do ( rd /s /q "%Backuppath%\%%d")
XCOPY /S /Y /V /e /f /z %Releasepath% %Backuppath%\%dtStamp%\ >nul /exclude:D:\BatchFiles\DeploymnetBatch\execludetempfiles.txt || goto :error

if %DEPLOYMENT_GROUP_NAME%==XPDEVBloom goto :XPDEVBloom
if %DEPLOYMENT_GROUP_NAME%==XPPRDBloom goto :XPPRDBloom
if %DEPLOYMENT_GROUP_NAME%==ULSIT goto :ULSIT
if %DEPLOYMENT_GROUP_NAME%==ULUAT goto :ULUAT
if %DEPLOYMENT_GROUP_NAME%==ULWSPRD goto :ULWSPRD

:XPDEVBloom
exit /b 0

:XPPRDBloom
exit /b 0

:ULSIT
exit /b 0

:ULUAT
exit /b 0

:ULWSPRD
exit /b 0

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%