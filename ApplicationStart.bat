@echo off
SET Appname1=WebStore
SET Appname2=WebStoreAPI
cd C:\WINDOWS\system32\inetsrv
appcmd.exe start apppool /apppool.name:"%Appname1%" || goto :error
appcmd.exe start site /site.name:"%Appname1%" || goto :error
appcmd.exe start apppool /apppool.name:"%Appname2%" || goto :error
appcmd.exe start site /site.name:"%Appname2%" || goto :error

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%