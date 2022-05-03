@echo off

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