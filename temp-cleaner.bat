@echo off
title TEMP Cleaner
goto start

:start
cls
echo TEMP Cleaner Luncher by KZL
echo Loading configuration, please wait ...
set VER=1.0.0
set dir=%temp%
set github-link=https://github.com/KZL00/TEMP-Cleaner
set license=GNU GENERAL PUBLIC LICENSE (version 3)
timeout 1 /nul
goto menu

:menu
cls
title TEMP Cleaner %ver% by KZL (%github-link%)
echo TEMP Cleaner %ver% by KZL (%github-link%)
echo.
echo Press a button from 1 to 4 - each of these buttons has its own function as described below:
echo.
echo 1 - Delete the TMP files
echo.
echo 2 - Program and license information
echo 3 - Page on GitHub
echo.
echo 4 - End sessions (will close the program)
choice /c 1234 /n
if %errorlevel%==1 goto clear-init
if %errorlevel%==2 goto info
if %errorlevel%==3 goto github
if %errorlevel%==4 exit

:clear-init
cls
echo Checking TMP Directory...
cd %dir%
if exist * goto clear-warning
if not exist * goto good-to-go

:clear-warning
cls
dir
echo.
echo Your PC needs deep cleaning! Check the list above and select the appropriate action.
echo Press 1 to clear data and reclaim disk space.
echo Press 2 to stop the current operations and exit the program.
choice /c 12 /n
if %errorlevel%==1 goto clear
if %errorlevel%==2 exit

:clear
cls
cd %dir%
del *
echo Reclaiming disk space, please wait (this process may take some time) ...
goto menu

:good-to-go
cls
echo Your PC doesn't need cleaning. Your PC is good to go!
pause
goto menu

:info
cls
echo TEMP Cleaner
echo %ver% by KZL
echo.
echo Source code avaible on GitHub: %github-link%
echo Working under license: %license%
echo.
pause /nul
goto menu

:github
cls
start %github-link%
goto menu