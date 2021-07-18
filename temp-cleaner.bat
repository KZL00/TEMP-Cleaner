@echo off
title TEMP Cleaner
goto start

:start
cls
echo [%date% %time%] TEMP Cleaner Luncher by KZL >> TEMP-Cleaner-Log.txt
echo [%date% %time%] Lunching TEMP Cleaner... >> TEMP-Cleaner-Log.txt
echo [%date% %time%] Press [9] to lunch Debug Menu >> TEMP-Cleaner-Log.txt
echo TEMP Cleaner Luncher by KZL
goto int

:int
echo Loading configuration, please wait ...
echo [%date% %time%] Loading configuration... >> TEMP-Cleaner-Log.txt
set VER=1.0.2 Pre-release
echo [%date% %time%] Value Loaded: VER = %ver% >> TEMP-Cleaner-Log.txt
set debug-menu-ver=1.0.0
echo [%date% %time%] Value Loaded: debug-menu-ver = %debug-menu-ver% >> TEMP-Cleaner-Log.txt
set dir=%temp%
echo [%date% %time%] Value Loaded: DIR = %dir% >> TEMP-Cleaner-Log.txt
set github-link=https://github.com/KZL00/TEMP-Cleaner
echo [%date% %time%] Value Loaded: github-link = %github-link% >> TEMP-Cleaner-Log.txt
set github-bug-link=https://github.com/KZL00/TEMP-Cleaner/issues/new/choose
echo [%date% %time%] Value Loaded: github-bug-link = %github-bug-link% >> TEMP-Cleaner-Log.txt
set license=GNU GENERAL PUBLIC LICENSE (version 3)
echo [%date% %time%] Value Loaded: license = %license% >> TEMP-Cleaner-Log.txt
set license-file=LICENSE.txt
echo [%date% %time%] Value Loaded: license-file = %license-file% >> TEMP-Cleaner-Log.txt
echo [%date% %time%] TEMP Cleaner Version Loaded: %ver% >> TEMP-Cleaner-Log.txt
timeout 1 /nul
goto menu

:menu
cls
echo [%date% %time%] TEMP Cleaner succesfully lunched >> TEMP-Cleaner-Log.txt
title TEMP Cleaner %ver% by KZL (%github-link%)
echo TEMP Cleaner %ver% by KZL (%github-link%)
echo.
echo Press a button from 1 to 6 - each of these buttons has its own function as described below:
echo.
echo 1 - Delete the TMP files
echo 2 - Open TMP folder
echo.
echo 3 - Program and license information
echo 4 - Page on GitHub
echo 5 - Report Bug / incorrect translation
echo.
echo 6 - End session (will close the program)
choice /c 123456789 /n
if %errorlevel%==1 goto clear-init
if %errorlevel%==2 goto tmp-folder
if %errorlevel%==3 goto info
if %errorlevel%==4 goto github
if %errorlevel%==5 goto github-bug
if %errorlevel%==6 goto End
if %errorlevel%==7 goto menu
if %errorlevel%==8 goto menu
if %errorlevel%==9 goto debug-menu

:End
cls
echo [%date% %time%] Session Ended >> TEMP-Cleaner-Log.txt
exit

:clear-init
echo [%date% %time%] Preparing... >> TEMP-Cleaner-Log.txt
cls
echo Checking TMP Directory...
cd %dir%
if exist * goto clear-warning
if not exist * goto good-to-go

:clear-warning
echo [%date% %time%] PC needs deep cleaning >> TEMP-Cleaner-Log.txt
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
echo [%date% %time%] Cleaning... >> TEMP-Cleaner-Log.txt
cls
cd %dir%
del *
echo Reclaiming disk space, please wait (this process may take some time) ...
if exist * goto clear-error
if not exist * goto clear-complete

:clear-complete
echo [%date% %time%] Requested operations completed. >> TEMP-Cleaner-Log.txt
cls
echo Ready! Your computer has been cleared of unnecessary temporary data!
pause
goto menu

:clear-error
cls
echo Unfortunately, we were unable to remove all of the TMP files.
echo You can manually open the TMP folder and try to delete the remaining files or run the program with Administrator rights.
echo.
echo Press 1 to try again.
echo Press 2 to return to the menu.
choice /c 12 /n
if %errorlevel%==1 goto clear
if %errorlevel%==2 goto menu

:good-to-go
echo [%date% %time%] Requested operations completed. >> TEMP-Cleaner-Log.txt
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

:github-bug
cls
start %github-bug-link%
goto menu

:debug-menu
title [Debug Menu] TEMP Cleaner %ver% by KZL (%github-link%)
echo [%date% %time%] Debug Menu Enabled >> TEMP-Cleaner-Log.txt
cls
echo KZL's TEMP Cleaner Debug Menu [Debug Menu Version: %debug-menu-ver%] [TEMP Cleaner Version: %ver%]
echo.
echo WARNING: use the Debug Menu with caution, improper use may result in, for example, data loss.
echo.
echo Press a button from 1 to 9 - each of these buttons has its own function as described below:
echo.
echo 1 - Change Value
echo 2 - Show all values
echo 3 - Delete Logs
echo 4 - Open Logs TXT File
echo 5 - Go to (batch command - if you are not a developer you should not use this option)
echo 6 - 
echo 7 - 
echo 8 - Re-initiate TEMP Cleaner (returns values to their initial state)
echo.
echo 9 - Close Debug Menu
echo.
choice /c 123456789 /n
if %errorlevel%==1 goto change-value
if %errorlevel%==2 goto show-values
if %errorlevel%==3 goto del-logs
if %errorlevel%==4 goto open-logs
if %errorlevel%==5 goto goto
if %errorlevel%==6 goto debug-menu
if %errorlevel%==7 goto debug-menu
if %errorlevel%==8 goto re-int

if %errorlevel%==9 goto q-debug

:q-debug
echo [%date% %time%] Debug Menu Disabled >> TEMP-Cleaner-Log.txt
goto menu

:change-value
cls
echo Enter the name of the value:
set /p "s-value=>>"
echo.
echo Enter new value of %s-value%
set /p "new-value=>>"
cls
echo [%date% %time%] Value (%s-value%) changed from %s-value% to %new-value% using Debug Menu >> TEMP-Cleaner-Log.txt
echo Value (%s-value%) changed from %s-value% to %new-value%
set %s-value%=%new-value%
pause
goto debug-menu

:show-values
cls
echo Values:
echo.
echo VER = %ver%
echo debug-menu-ver = %debug-menu-ver%
echo DIR = %dir%
echo github-link = %github-link%
echo github-bug-link = %github-bug-link%
echo license = %license%
echo license-file = %license-file%
echo.
pause
goto debug-menu

:tmp-folder
cls
start %DIR%
goto debug-menu

:goto
cls
echo Where do you want to go?
set /p "go=>>"
goto %go%

:del-logs
echo [%date% %time%] Deleting logs... >> TEMP-Cleaner-Log.txt
cls
echo Deleting logs, please wait....
del TEMP-Cleaner-Log.txt
cls
echo Logs deleted.
echo [%date% %time%] Logs deleted using Debug Menu >> TEMP-Cleaner-Log.txt
pause
goto debug-menu

:open-logs
cls
start TEMP-Cleaner-Log.txt
goto debug-menu

:re-int
cls
echo Re-initiation
echo.
echo This process resets the values to their initial state. We recommend that you use this option if you have an error.
echo Do you want to continue?
echo.
echo Press 1 to continue
echo Press 2 to cancel
choice /c 12 /n
if %errorlevel%==1 goto re-int2
if %errorlevel%==2 goto debug-menu

:re-int2
cls
echo Start the re-initiation process, please wait...
echo [%date% %time%] re-initiation requested using Debug Menu >> TEMP-Cleaner-Log.txt
timeout 1 /nul
goto int