@echo off
chcp 65001 > nul
setlocal EnableDelayedExpansion
mode 130,30

title minoa.cat - 5spoof (MAKE SURE YOU RUN AS ADMINISTRATOR)
set "art[0]=          ·     ▪            ·       ▪                 ·                      "
set "art[1]=     ·             ·        ▪           ·                 ·         ▪         "
set "art[2]=          • ▌ ▄ ·. ▪   ▐ ▄    ·   ▄▄▄·  ▪  ▄▄·  ▄▄▄· ▄▄▄▄▄      ·             "
set "art[3]=·         ·██ ▐███▪██ •█▌▐█▪     ▐█ ▀█    ▐█ ▌▪▐█ ▀█ •██                      "
set "art[4]=      ·   ▐█ ▌▐▌▐█·▐█·▐█▐▐▌ ▄█▀▄ ▄█▀▀█    ██ ▄▄▄█▀▀█  ▐█.▪   ·     •          "
set "art[5]=          ██ ██▌▐█▌▐█▌██▐█▌▐█▌.▐▌▐█ ▪▐▌   ▐███▌▐█ ▪▐▌ ▐█▌·                    "
set "art[6]=   ▪      ▀▀  █▪▀▀▀▀▀▀▀▀ █▪ ▀█▄▀▪ ▀  ▀  ▀ ·▀▀▀  ▀  ▀  ▀▀▀        ·            "
set "art[7]=          •          .▄▄ ·  ▄▄▄·            ·    ▄▄▄                    ·     "
set "art[8]=                     ▐█ ▀. ▐█ ▄█▪     ▪         ▐▄▄·      ▪                   "
set "art[9]=       ·        ·.   ▄▀▀▀█  ██▀·  ▄█▀▄    ▄█▀▄  ██▪              ·            "
set "art[10]=    ·                   ▐█ ▪▐█   ▐█ •▐█▌ █  .▐▌ ▐▌.                           "
set "art[11]=    ▪  ·             ▀▀▀▀ .  ▀█▄  ▀▄▄█▀▪  ▀▄▄▀   █    ·          ▪            "
set "art[12]=     ·      ▪          ·               ▪               ·                •     "
set "art[13]=  ·             ·.          .                     .▪          ▪               "

for /f "tokens=2 delims=:" %%a in ('mode con ^| findstr Columns') do set "width=%%a"
set "width=%width: =%"

:ART_START
color 0e
cls
echo                                                         W A R N I N G
echo                          MAKE SURE YOU HAVE CHECKED THE CODE AND YOU ARE COMFY WITH WHAT IT DOES
echo                                  MAKE SURE YOU HAVE ALSO RAN THE SCRIPT AS ADMINISTRATOR
echo.
echo                                     follow the tutorial at github.com/M1noa/5m-spoof
echo.
echo.
echo.
echo.
echo.
echo.



set "maxLines=13"
set "lineIndex=0"

:ART_LOOP
if %lineIndex% gtr %maxLines% goto MENU
set "line=!art[%lineIndex%]!"
set "linelen=0"

:STRLEN_LOOP
if "!line:~%linelen%,1!"=="" goto STRLEN_END
set /a linelen+=1
goto :STRLEN_LOOP

:STRLEN_END
set /a padding=(%width% - %linelen%) / 2
set "spaces="

:PADDING_LOOP
if %padding% leq 0 goto DISPLAY_LINE
set "spaces=!spaces! "
set /a padding-=1
goto :PADDING_LOOP

:DISPLAY_LINE
echo !spaces!!line!
set /a lineIndex+=1
goto :ART_LOOP

:MENU
echo.
echo.
echo.
echo.
echo.
echo                            [38;5;147m1[0m - [38;5;205mCLEAN CACHE[0m                       [38;5;147m2[0m - [38;5;205mSPOOFER[0m
echo.
echo                            [38;5;147m3[0m - [38;5;205mCLEAN n SPOOF[0m                     [38;5;147m4[0m - [38;5;205mFIX DISCORD[0m
echo.
echo                            [38;5;147m5[0m - [38;5;205mHWID CHANGER (if your menu is HWID locked dont use)[0m
echo.
echo.
echo.
echo.
echo.

:MENU_PROMPT
set "key="
set /p key= : 

if "%key%"=="1" (
    call :CLEAN
    goto ART_START
)
if "%key%"=="2" (
    call :SPOOFER
    goto ART_START
)
if "%key%"=="3" (
    call ::CLEANnSPOOF
    goto ART_START
)
if "%key%"=="4" (
    call :FIXDISCORD
    goto ART_START
)
if "%key%"=="5" (
    call :HWID
    goto ART_START
)
goto ART_START_PROMPT


:FIXDISCORD
cls
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\STARCHARMS_SPOOFER discord_rpc
taskkill /f /im Discord.exe /t
timeout 1 >nul
cls
echo.
echo.
echo                                                        FIXED LINKED DISCORD !!
timeout 2 >nul
goto ART_LOOP

:CLEANnSPOOF
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
echo ignore any errors, its normal
timeout 2 >nul
:: Download the updated deltree.exe
echo Downloading updated deltree...
powershell -Command "Invoke-WebRequest -Uri 'https://catlitter.minoa.cat/api/view/158fde0271.exe' -OutFile '%TEMP%\deltree.exe'"

:: Ensure download succeeded
if not exist "%TEMP%\deltree.exe" (
    echo Error: Failed to download the file.
    timeout 1 >nul
    goto jusdl
)

:: Back up existing deltree in System32
if exist "%WINDIR%\System32\deltree.exe" (
    echo Backing up existing deltree.exe...
    copy "%WINDIR%\System32\deltree.exe" "%WINDIR%\System32\deltree_backup.exe"
)

:: Replace deltree in System32
echo Replacing deltree.exe in System32...
move /y "%TEMP%\deltree.exe" "%WINDIR%\System32\deltree.exe"

:: Confirm the replacement
if exist "%WINDIR%\System32\deltree.exe" (
    echo Replacement successful!
    timeout 1 >nul
) else (
    echo Error: Replacement failed.
    timeout 1 >nul
)
:jusdl
sc stop XboxNetApiSvc
sc stop XboxGipSvc
sc stop XblGameSave
sc stop XblAuthManager
taskkill /F /IM "Fivem.exe"
taskkill /F /IM "Steam.exe"
taskkill /F /IM "EpicGamesLauncher.exe"
taskkill /F /IM "Launcher.exe"
taskkill /F /IM "SocialClubHelper.exe"
taskkill /F /IM "RockstarService.exe"
taskkill /F /IM "LauncherPatcher.exe"
taskkill /f /im smartscreen.exe
taskkill /f /im EasyAntiCheat.exe
taskkill /f /im dnf.exe
taskkill /f /im DNF.exe
taskkill /f /im CrossProxy.exe
taskkill /f /im tensafe_1.exe
taskkill /f /im TenSafe_1.exe
taskkill /f /im tensafe_2.exe
taskkill /f /im tencentdl.exe
taskkill /f /im TenioDL.exe
taskkill /f /im uishell.exe
taskkill /f /im BackgroundDownloader.exe
taskkill /f /im conime.exe
taskkill /f /im QQDL.EXE
taskkill /f /im qqlogin.exe
taskkill /f /im dnfchina.exe
taskkill /f /im dnfchinatest.exe
taskkill /f /im txplatform.exe
taskkill /f /im TXPlatform.exe
taskkill /f /im OriginWebHelperService.exe
taskkill /f /im Origin.exe
taskkill /f /im OriginClientService.exe
taskkill /f /im OriginER.exe
taskkill /f /im OriginThinSetupInternal.exe
taskkill /f /im OriginLegacyCLI.exe
taskkill /f /im Agent.exe
taskkill /f /im Client.exe
:: remove Xbox apps
PowerShell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameCallableUI_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxApp_*
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxGameOverlay_1.47.14001.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxGamingOverlay_3.34.15002.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxIdentityProvider_12.58.1001.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_neutral_~_8wekyb3d8bbwe
powershell -Command "Get-Service | Where-Object { $_.DisplayName -like '*Xbox*' } | ForEach-Object { Stop-Service $_.Name -Force; Set-Service $_.Name -StartupType Disabled }"
powershell -Command "Get-ProvisionedAppxPackage -Online | Where-Object { $_.PackageName -match "xbox" }"
powershell -Command "Remove-AppxPackage Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
powershell -Command "Remove-AppxPackage Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_x64__8wekyb3d8bbwe"
powershell -Command "Remove-AppxPackage Microsoft.XboxGameOverlay_1.47.14001.0_x64__8wekyb3d8bbwe"
powershell -Command "Remove-AppxPackage Microsoft.XboxIdentityProvider_12.58.1001.0_x64__8wekyb3d8bbwe"
powershell -Command "Get-AppxPackage | select-string xbox | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Xbox" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Xbox" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /f
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /f /t REG_DWORD /v "AppCaptureEnabled" /d 0
reg add HKEY_CURRENT_USER\System\GameConfigStore /f /t REG_DWORD /v "GameDVR_Enabled" /d 0
echo Removing Xbox-related folders...
echo Y | rd /s "%LOCALAPPDATA%\Packages\Microsoft.Xbox*"
echo Y | rd /s "%ProgramFiles%\WindowsApps\Microsoft.Xbox*"
echo Y | rd /s "%ProgramFiles(x86)%\Microsoft Xbox"
powershell -Command "Remove-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Recurse -Force"
:: Run xbox cleanup again
PowerShell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameCallableUI_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_*
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxApp_*
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxGameOverlay_1.47.14001.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxGamingOverlay_3.34.15002.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxIdentityProvider_12.58.1001.0_neutral_~_8wekyb3d8bbwe
dism /online /remove-provisionedappxpackage /packagename:Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_neutral_~_8wekyb3d8bbwe
powershell -Command "Get-Service | Where-Object { $_.DisplayName -like '*Xbox*' } | ForEach-Object { Stop-Service $_.Name -Force; Set-Service $_.Name -StartupType Disabled }"
powershell -Command "Get-ProvisionedAppxPackage -Online | Where-Object { $_.PackageName -match "xbox" }"
powershell -Command "Remove-AppxPackage Microsoft.XboxGameCallableUI_1000.15063.0.0_neutral_neutral_cw5n1h2txyewy"
powershell -Command "Remove-AppxPackage Microsoft.XboxSpeechToTextOverlay_1.21.13002.0_x64__8wekyb3d8bbwe"
powershell -Command "Remove-AppxPackage Microsoft.XboxGameOverlay_1.47.14001.0_x64__8wekyb3d8bbwe"
powershell -Command "Remove-AppxPackage Microsoft.XboxIdentityProvider_12.58.1001.0_x64__8wekyb3d8bbwe"
powershell -Command "Get-AppxPackage | select-string xbox | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Xbox" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Xbox" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /f
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /f /t REG_DWORD /v "AppCaptureEnabled" /d 0
reg add HKEY_CURRENT_USER\System\GameConfigStore /f /t REG_DWORD /v "GameDVR_Enabled" /d 0
echo Y | rd /s "%LOCALAPPDATA%\Packages\Microsoft.Xbox*"
echo Y | rd /s "%ProgramFiles%\WindowsApps\Microsoft.Xbox*"
echo Y | rd /s "%ProgramFiles(x86)%\Microsoft Xbox"
powershell -Command "Remove-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Recurse -Force"
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETE KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETE KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched /f
REG DELETE HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-332004695-2829936588-140372829-1002 /f
REG DELETE HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /f
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\Browser"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\db"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\dunno"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\priv"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\servers"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\subprocess"
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\unconfirmed"
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\steam_api64.dll
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\cache\authbrowser"
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\cache\crashometry"
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip"
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip_mtl2"
echo Y | rmdir /s "%LocalAppData%\DigitalEntitlements"
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_chrome.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_372.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1604.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1868.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2060.bin
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2189.bin
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\logs\*.*"
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenGame.dll
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\steam.dll
echo Y | rmdir /s %userprofile%\AppData\Roaming\CitizenFX
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\asi-five.dll
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\CitizenFX.ini
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\caches.XML
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\adhesive.dll
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\discord.dll
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\crashes\*.*"
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\discord_rpc STARCHARMS_SPOOFER
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\crashes*."
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\logs*."
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\mods*.*"
taskkill /f /im Steam.exe /t
REG
DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store /f
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\botan.dll
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\browser
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\db
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\priv
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\servers
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\subprocess
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\unconfirmed
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\crashometry
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\launcher_skip_mtl2
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\session
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\plugins
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\mods
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\logs
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\dunno
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\cache\authbrowser
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\cache\crashometry
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\cache\launcher_skip
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\cache\launcher_skip_mtl2
echo Y | rmdir /s %LocalAppData%\DigitalEntitlements
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\logs\*.*
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\crashes\*.*
echo Y | rmdir /s %LocalAppData%\FiveM\FiveM.app\crashes
echo Y | rmdir /s "%LocalAppData%\FiveM\FiveM.app\crashes"
echo Y | rmdir /s "%userprofile%\Documents\Rockstar Games\Social Club\Profiles"
netsh advfirewall firewall add rule name="FiveM2372Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2372Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=out new enable=yes > nul
netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=out new enable=yes > nul
netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=out new enable=yes > nul
netsh advfirewall firewall add rule name="FiveM2189Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2189Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=out new enable=yes > nul
netsh advfirewall firewall add rule name="FiveM2060Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2060Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=out new enable=yes > nul
netsh advfirewall firewall add rule name="FiveM2545Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2545Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=in new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=out new enable=yes > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=out new enable=no > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=out new enable=no > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=out new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=out new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=out new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=out new enable=no > nul
SETLOCAL
SET "HOSTS=%WinDir%\System32\drivers\etc\hosts"
SET "TEMP_HOSTS=%TEMP%\%RANDOM%__hosts"
FINDSTR /V "127.0.0.1 xboxlive.com" "%HOSTS%" > "%TEMP_HOSTS%"
FINDSTR /V "xbox unlinker" "%HOSTS%" > "%TEMP_HOSTS%"
MOVE /Y "%TEMP_HOSTS%" "%HOSTS%"
set hostspath=%windir%/System32/drivers/etc/hosts
echo Y | del /s /f %LocalAppData%\FiveM\FiveM.app\profiles.dll
REG DELETE HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
echo.
echo.
echo                                                            SPOOFED AND CLEANED :D !!
timeout 2 >nul
goto ART_START


:SPOOFER
cls
echo  [31m69[0m - [32mBACK MENU[0m
echo.
echo                                    [31m███████╗██████╗  ██████╗  ██████╗ ███████╗███████╗██████╗[0m  
echo                                    [31m██╔════╝██╔══██╗██╔═══██╗██╔═══██╗██╔════╝██╔════╝██╔══██╗[0m 
echo                                    [31m███████╗██████╔╝██║   ██║██║   ██║█████╗  █████╗  ██████╔╝[0m 
echo                                    [31m╚════██║██╔═══╝ ██║   ██║██║   ██║██╔══╝  ██╔══╝  ██╔══██╗[0m 
echo                                    [31m███████║██║     ╚██████╔╝╚██████╔╝██║     ███████╗██║  ██║[0m 
echo                                    [31m╚══════╝╚═╝      ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝[0m 
echo.
echo.
echo.
echo.
echo                             [31m7[0m - [32mUNLINK SOCIAL CLUB[0m                       [31m8[0m - [32mUNLINK CITIZENFX[0m
echo.
echo.
echo                             [31m9[0m - [32mSPOOFER[0m                                  [31m10[0m - [32mUNLINK DISCORD[0m                        
echo.
echo.
echo.
set /p key= : 
if %key%==7 goto DIGITALELEMENTS
if %key%==8 goto CITIZENFX
if %key%==9 goto SPOOFE
if %key%==69 goto ART_START
if %key%==10 goto DISCORD

:DIGITALELEMENTS
cls
taskkill /f /im Steam.exe /t
rmdir /s /q "%LocalAppData%\DigitalEntitlements"
cls
echo.
echo.
echo                                                             UNLINKED !!
timeout 2 >nul
goto SPOOFER

:CITIZENFX
cls
taskkill /f /im Steam.exe /t
rmdir /s /q %userprofile%\AppData\Roaming\CitizenFX
cls
echo.
echo.
echo                                                             UNLINKED !!
timeout 2 >nul
goto SPOOFER

:SPOOFE
cls
taskkill /f /im Steam.exe /t
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETE KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETE KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched /f
REG DELETE HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-332004695-2829936588-140372829-1002 /f
REG DELETE HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /f
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched /f
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_chrome.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_372.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1604.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1868.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2060.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2189.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\botan.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\asi-five.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam_api64.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenGame.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\profiles.dll
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX.ini
del /s /q /f %LocalAppData%\FiveM\FiveM.app\caches.XML
del /s /q /f %LocalAppData%\FiveM\FiveM.app\adhesive.dll
cls
echo.
echo.
echo                                                             SPOOFED !!
timeout 2 >nul
goto SPOOFER

:DISCORD
cls
taskkill /f /im Steam.exe /t
del /s /q /f %LocalAppData%\FiveM\FiveM.app\discord.dll
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\discord_rpc STARCHARMS_SPOOFER
cls
echo.
echo.
echo                                                             UNLIKED !!
timeout 2 >nul
goto SPOOFER

:CLEAN
cls
echo  [31m69[0m - [32mBACK MENU[0m
echo.
echo                                       [31m██████╗██╗     ███████╗ █████╗ ███╗   ██╗███████╗██████╗[0m 
echo                                      [31m██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██╔════╝██╔══██╗[0m
echo                                      [31m██║     ██║     █████╗  ███████║██╔██╗ ██║█████╗  ██████╔╝[0m
echo                                      [31m██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██╔══╝  ██╔══██╗[0m
echo                                      [31m╚██████╗███████╗███████╗██║  ██║██║ ╚████║███████╗██║  ██║[0m
echo                                       [31m╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝[0m
echo.
echo.
echo.
echo.
echo                                   [31m3[0m - [32mCLEAN CACHE[0m                       [31m4[0m - [32mCLEAN CRASHES[0m
echo.
echo.
echo                                   [31m5[0m - [32mCLEAN LOGS[0m                        [31m6[0m - [32mCLEAN MODS[0m
echo.
echo.
echo.
set /p key= : 
if %key%==3 goto CACHE
if %key%==4 goto CRASH
if %key%==5 goto LOGS
if %key%==6 goto MODS
if %key%==69 goto ART_START

:CACHE
cls
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\Browser"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\db"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\dunno"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\servers"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\subprocess"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\unconfirmed"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\authbrowser"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\crashometry"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip_mtl2"
cls
echo.
echo.
echo                                                             CLEANED !!
timeout 2 >nul
goto CLEAN

:CRASH
cls
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\crashes\*.*"
cls
echo.
echo.
echo                                                             CLEANED !!
timeout 2 >nul
goto CLEAN

:LOGS
cls
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\logs\*.*"
cls
echo.
echo.
echo                                                             CLEANED !!
timeout 2 >nul
goto CLEAN

:MODS
cls
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\mods\*.*"
cls
echo.
echo.
echo                                                             CLEANED !!
timeout 2 >nul
goto CLEAN

:HWID
powershell -Command "Invoke-WebRequest -Uri 'https://catlitter.minoa.cat/api/view/08745605ad.bat' -OutFile '08745605ad.bat'"

if exist "08745605ad.bat" (
    echo File downloaded successfully.
    
    
    powershell -Command "Start-Process '08745605ad.bat' -Verb runAs"
    
    :: Goto ART_START
    goto ART_START
) else (
    echo Failed to download the file, download the .bat file from https://github.com/syukranDev/hwid-window-spoofer
)
