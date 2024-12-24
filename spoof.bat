@echo off
chcp 65001 > nul
setlocal EnableDelayedExpansion
mode 130,30

title minoa.cat - 5spoof (MAKE SURE YOU RUN AS ADMINISTRATOR)
set "art[0]=          ·     ▪            ·       ▪                 ·                     "
set "art[1]=     ·        ·.   ·        ▪           ·                 ·         ▪        "
set "art[2]=     ·     ▪                ·       ▪             ·   ·                      "
set "art[3]= ·        ███▄ ▄███▓ ██▓ ███▄  ▪ █  ▒█████   ▄▄▄       ·         ▪           "
set "art[4]=    ▪    ▓██▒▀█▀ ██▒▓██▒ ██ ▀█   █ ▒██▒  ██▒▒████▄        ·     •            "
set "art[5]=·        ▓██  · ▓██░▒██▒▓██  ▀█ ██▒▒██░  ██▒▒██  ▀█▄                         "
set "art[6]=     ·   ▒██    ▒██ ░██░▓██▒  ▐▌██▒▒██ · ██░░██▄▄▄▄██   ·     •              "
set "art[7]=    ▪    ▒██▒   ░██▒░██░▒██░   ▓██░░ ████▓▒░ ▓█   ▓██▒                       "
set "art[8]=         ░ ▒░   ░  ░░▓  ░ ▒░ ▪ ▒ ▒ ░ ▒░▒░▒░  ▒▒   ▓▒█░       ·               "
set "art[9]=    •    ░  ░  •   ░ ▒ ░░ ░░   ░ ▒░  ░ ▒ ▒░   ▒   ▒▒ ░              ·        "
set "art[10]=         ░  •   ░  · ▒ ░ · ░   ░ ░ ░ ░ ░ ▒ ·  ░   ▒      ▪                   "
set "art[11]=    ·           ░    ░        ·  ░     ░ ░        ░  ░           ·           "
set "art[12]=          •      .▄▄ ·  ▄▄▄·            ·    ▄▄▄                    ·        "
set "art[13]=                 ▐█ ▀. ▐█ ▄█▪     ▪         ▐▄▄·      ▪                      "
set "art[14]=       ·        ·▄▀▀▀█  ██▀·  ▄█▀▄    ▄█▀▄  ██▪              ·               "
set "art[15]=    ·               ▐█ ▪▐█   ▐█ •▐█▌ █  .▐▌ ▐▌.                              "
set "art[16]=    ▪  ·         ▀▀▀▀ .  ▀█▄  ▀▄▄█▀▪  ▀▄▄▀   █    ·          ▪               "
set "art[17]=     ·      ▪          ·               ▪               ·                •    "
set "art[18]=  ·             ·.          .                     .▪          ▪              "

for /f "tokens=2 delims=:" %%a in ('mode con ^| findstr Columns') do set "width=%%a"
set "width=%width: =%"

:ART_START
color 0e
cls
echo                                                       W A R N I N G
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



set "maxLines=18"
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
echo                                                1 CLEAN n SPOOF
echo                                                   2 HWID CHANGER
echo.
echo.
echo.
echo.

:MENU_PROMPT
set "key="
set /p key= : 

if "%key%"=="1" (
    call :CLEANnSPOOF
    goto ART_START
)
if "%key%"=="2" (
    call :HWID
    goto ART_START
)
goto MENU_PROMPT

:CLEANnSPOOF
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
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\discord_rpc minoa5spoof
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\crashes*."
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\logs*."
echo Y | del /s /f "%LocalAppData%\FiveM\FiveM.app\mods*.*"
taskkill /f /im Steam.exe /t
REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store /f
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
taskkill /f /im Steam.exe /t
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETEH KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETEH KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
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
taskkill /f /im Steam.exe /t
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETEH KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETEH KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
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
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\Browser"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\db"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\dunno"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\servers"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\subprocess"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\unconfirmed"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam_api64.dll
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\authbrowser"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\crashometry"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip_mtl2"
rmdir /s /q "%LocalAppData%\DigitalEntitlements"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\profiles.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_chrome.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_372.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1604.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1868.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2060.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2189.bin
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\mods\*.*"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\logs\*.*"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenGame.dll
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam.dll
rmdir /s /q %userprofile%\AppData\Roaming\CitizenFX
del /s /q /f %LocalAppData%\FiveM\FiveM.app\asi-five.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX.ini
del /s /q /f %LocalAppData%\FiveM\FiveM.app\caches.XML
del /s /q /f %LocalAppData%\FiveM\FiveM.app\adhesive.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\discord.dll
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\crashes\*.*"
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\discord_rpc minoa5spoof
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\minoa5spoof discord_rpc
taskkill /f /im Discord.exe /t
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\crashes"
rmdir /s /q %userprofile%\AppData\Roaming\CitizenFX
rmdir /s /q "%userprofile%\Documents\Rockstar Games\Social Club\Profiles"
taskkill /f /im Steam.exe /t
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETEH KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETEH KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
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
netsh advfirewall firewall add rule name="FiveM2372Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2372Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2372_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2372Block" dir=out new enable=no > nul

netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall add rule name="FiveMSteamBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_SteamChild.exe" > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMSteamBlock" dir=out new enable=no > nul

netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveMRockstarBlock" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveMRockstarBlock" dir=out new enable=no > nul

netsh advfirewall firewall add rule name="FiveM2189Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2189Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\FiveM_b2189_GTAProcess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2189Block" dir=out new enable=no > nul

netsh advfirewall firewall add rule name="FiveM2060Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2060Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2060_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2060Block" dir=out new enable=no > nul

netsh advfirewall firewall add rule name="FiveM2545Block" dir=in action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall add rule name="FiveM2545Block" dir=out action=block profile=any program="%LocalAppData%\FiveM\FiveM.app\data\cache\subprocess\fivem_b2545_gtaprocess.exe" > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=in new enable=no > nul
netsh advfirewall firewall set rule name="FiveM2545Block" dir=out new enable=no > nul
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\HardwareID /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing\Store /f
REG DELETE HKEY_CURRENT_USER\Software\WinRAR\ArcHistory /f
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings\S-1-5-21-1282084573-1681065996-3115981261-1001 /va /f
REG DELETEH KEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView /f
REG DELETEH KEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache /f
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
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\Browser"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\db"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\dunno"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\servers"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\subprocess"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\unconfirmed"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam_api64.dll
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache\authbrowser"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\crashometry"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cache\launcher_skip_mtl2"
rmdir /s /q "%LocalAppData%\DigitalEntitlements"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\profiles.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_chrome.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_372.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1604.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_1868.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2060.bin
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX_SubProcess_game_2189.bin
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\mods\*.*"
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\logs\*.*"
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenGame.dll
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\cfx_curl_x86_64.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\steam.dll
rmdir /s /q %userprofile%\AppData\Roaming\CitizenFX
del /s /q /f %LocalAppData%\FiveM\FiveM.app\asi-five.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\CitizenFX.ini
del /s /q /f %LocalAppData%\FiveM\FiveM.app\caches.XML
del /s /q /f %LocalAppData%\FiveM\FiveM.app\adhesive.dll
del /s /q /f %LocalAppData%\FiveM\FiveM.app\discord.dll
del /s /q /f "%LocalAppData%\FiveM\FiveM.app\crashes\*.*"
RENAME %userprofile%\AppData\Roaming\discord\0.0.309\modules\discord_rpc minoa5spoof
cd %localappdata%\FiveM\FiveM.app\data\
del /s /q cache\*
del /s /q server-cache\*
del /s /q server-cache-priv\*
cd %localappdata%\FiveM\FiveM.app\
del /s /q bin\*
del /s /q crashes\*
del /s /q logs\*
powershell -Command "& {Get-AppxPackage -AllUsers xbox | Remove-AppxPackage}"
sc stop XblAuthManager
sc stop XblGameSave
sc stop XboxNetApiSvc
sc stop XboxGipSvc
sc delete XblAuthManager
sc delete XblGameSave
sc delete XboxNetApiSvc
sc delete XboxGipSvc
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disableL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
set hostspath=%windir%\System32\drivers\etc\hosts
echo 127.0.0.1 xboxlive.com >> %hostspath%
echo 127.0.0.1 user.auth.xboxlive.com >> %hostspath%
echo 127.0.0.1 presence-heartbeat.xboxlive.com >> %hostspath%
rd %userprofile%\AppData\Local\DigitalEntitlements /q /s
taskkill /F /IM "Fivem.exe"
taskkill /F /IM "Discord.exe"
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
taskkill /f /im dnf.exe
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
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\*.*"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin"
del /f /s /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*.*"
rmdir /s /q "%systemdrive%\ProgramData\Electronic Arts"
del /f /s /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\*.log"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\EAProxyInstaller.exe"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\igoproxy.exe"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\igoproxy64.exe"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\OriginCrashReporter.exe"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\OriginER.exe"
del /f /s /q "%systemdrive%\Program Files (x86)\Origin\OriginWebHelper.exe
del /f /s /q "%systemdrive%\Windows\System32\eac_usermode_*.dll"
del /f /s /q "%username%\AppData\LocalLow\DNF\*.trc"
del /f /s /q "%username%\AppData\LocalLow\DNF\*.zip"
rmdir /s /q "%username%\AppData\Local\g3"
del /f /s /q "%username%\AppData\Local\g3\*.*"
del /f /s /q "%username%\AppData\Local\g3\Saved\SaveGames\SaveSettings.sav"
del /f /s /q "%username%\AppData\Local\g3\Saved\SaveGames\*.*"
rmdir /s /a:h /a:a /q "%username%\AppData\Local\g3\"
del /s /f /a:h /a:a /q "%username%\AppData\Local\g3\*.*"
del /s /f /a:h /a:a /q "%username%\AppData\Local\g3\Saved\SaveGames\SaveSettings.sav"
del /s /f /a:h /a:a /q "%username%\AppData\Local\g3\Saved\SaveGames\*.*"
rmdir /s /q "%appdata%\Roaming\EasyAntiCheat"
del /f /s /q "%appdata%\Roaming\EasyAntiCheat\*.*"
rmdir /s /a:h /a:a /q "%appdata%\Roaming\EasyAntiCheat"
del /s /f /a:h /a:a /q "%appdata%\Roaming\EasyAntiCheat\*.*"
rmdir /s /q "%systemdrive%\Program Files\Common Files\EAInstaller\"
rmdir /s /a:h /a:a /q "%systemdrive%\Program Files\Common Files\EAInstaller\"
rmdir /s /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\"
rmdir /s /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\"
del /f /s /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\*.*"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\.QtWebEngineProcess"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\.Origin"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Origin"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Origin"
rmdir /s /q "%systemdrive%\Users\%username%\.QtWebEngineProcess"
rmdir /s /q "%systemdrive%\Users\%username%\Saved Games\Respawn\Apex\assets"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\Saved Games\Respawn\Apex\assets"
rmdir /s /q "%systemdrive%\Users\%username%\Saved Games\Respawn\Apex\profile\*.*"
rmdir /s /a:h /a:a /q "%systemdrive%\Users\%username%\Saved Games\Respawn\Apex\profile\*.*"
rmdir /s /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\Telemetry\*.*"
rmdir /s /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*"
rmdir /s /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\*.log"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\EAProxyInstaller.exe"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\igoproxy.exe"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\igoproxy64.exe"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\OriginCrashReporter.exe"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\OriginER.exe"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\Origin\OriginWebHelper.exe
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\eac_usermode_*.dll"
del /s /f /a:h /a:a /q "%username%\AppData\LocalLow\DNF\*.trc"
del /s /f /a:h /a:a /q "%username%\AppData\LocalLow\DNF\*.zip"
RD /S /Q "%localappdata%\UnrealEngine"
RD /S /Q "%localappdata%\UnrealEngineLauncher"
RD /S /Q "%localappdata%\Temp\ecache.bin"
RD /S /Q "%localappdata%\Microsoft\Feeds"
RD %windir%\$hf_mig$ /Q /S
dir %windir%\$NtUninstall* /a:d /b >%windir%\2950800.txt
del "C:\Recovery\ntuser.sys"
del "C:\MSOCache" /p
del "C:\Users\Public\Shared Files"
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
erase "%LOCALAPPDATA%\Microsoft\Windows\Tempor~1\*.*" /f /s /q
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache\*.*"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules\*.*"
rmdir /s /q "%systemdrive%\Windows\Logs\WindowsUpdate\*.*"
rmdir /s /q "%systemdrive%\Windows\WindowsUpdate.log\*.*"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\*.*"
rmdir /s /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*"
rmdir /s /q "%systemdrive%\Users\caspue\AppData\Roaming\Microsoft\Windows\Recent\*.*"
rmdir /s /q "%systemdrive%\Users\caspue\AppData\Local\Microsoft\Windows\WebCache\*.*"
rmdir /s /q "%systemdrive%\Users\caspue\AppData\Local\Packages\*.*"
rmdir /s /q "%systemdrive%\Users\caspue\AppData\Local\Speech Graphics\Carnival\*.*"
rmdir /s /q "%systemdrive%\ProgramData\USOPrivate\UpdateStore\*.*"
rmdir /s /q "%systemdrive%\ProgramData\USOShared\Logs\*.*"
netsh interface set interface "Local Area Connection" disable
RD /s /q "C:\Users\%Username%\AppData\Local\CEF"
RD /s /q "C:\Users\%Username%\AppData\Local\Comms"
RD /s /q "C:\Users\%Username%\AppData\Local\ConnectedDevicesPlatform"
RD /s /q "C:\Users\%Username%\AppData\Local\CrashDumps"
RD /s /q "C:\Users\%Username%\AppData\Local\CrashReportClient"
RD /s /q "C:\Users\%Username%\AppData\Local\D3DSCache"
RD /s /q "C:\Users\%Username%\AppData\Local\DBG"
RD /s /q "C:\Users\%Username%\AppData\Local\Microsoft\Feeds"
RD /s /q "C:\Users\%Username%\AppData\Local\VirtualStore"
del /s /q "C:\Users\%Username%\AppData\Local\VirtualStore" do rmdir "%%p"
RD /s /q "C:\Users\%Username%\AppData\Local\UnrealEngineLauncher"
RD /s /q "C:\Users\%Username%\AppData\Local\UnrealEngine"
RD /s /q "C:\Users\%Username%\AppData\Local\Speech Graphics"
RD /s /q "C:\Users\%Username%\AppData\Local\Publishers"
RD /s /q "C:\Users\%Username%\AppData\Local\Programs\Common"
RD /s /q "C:\Users\%Username%\AppData\Local\PlaceholderTileLogoFolder"
RD /s /q "C:\Users\%Username%\AppData\Roaming\EasyAntiCheat"
del /f /s /q "C:\Users\Public\Libraries\*.*"
rmdir /s /q "C:\Users\Public\Libraries"
del /f /s /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds\*.*"
rmdir /s /q "C:\Users\%username%\AppData\Local\Microsoft\Feeds"
del /f /s /q "C:\MSOCache\*.*"
rmdir /s /q "C:\MSOCache"
del /f /s /q "C:\Intel\*.*"
rmdir /s /q "C:\Intel"
del /f /s /q "C:\Recovery\*.*"
rmdir /s /q "C:\Recovery"
del /q /s "D:\desktop.ini"
del /q /s "C:\Users\%username%\AppData\Local\Microsoft\Feeds"
del /a /q /s "C:\Users\%Username%\AppData\Local\updater.log"
del "%localappdata%\Microsoft\Feeds" /s /f /q
RD /S /Q "%C:\MSOCache\{71230000-00E2-0000-1000-00000000}"
del /s /f /q %userprofile%\Recent\*.*
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q C:\Windows\Public\Libraries\*.*
del /s /f /q %windir%\Prefetch\*.*
rd /s /q %windir%\Prefetch
md %windir%\Prefetch
rmdir /s /q "%systemdrive%\Windows\System32\wbem\Repository\MAPPING3.MAP\*.*"
del %windir%\KB*.log /f /q
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.dlf
del /f /s /q %systemdrive%\*.old
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q "%systemdrive%\ProgramData\Origin\AchievementCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\CatalogCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\CustomBoxartCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\EntitlementCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\IGOCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Logs\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\NonOriginContentCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Subscription\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Telemetry\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\*"
del /f /s /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*"
del /f /s /q "%systemdrive%\ProgramData\Electronic Arts\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\AchievementCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\CatalogCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\CustomBoxartCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\EntitlementCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\IGOCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\Logs\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\NonOriginContentCache\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\Subscription\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\Telemetry\*"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\*"
del /f /s /q "x:\$RECYCLE.BIN"
del /f /s /q "x:\PerfLogs"
del /f /s /q "x:\MSOCache"
del /f /s /q "x:\Recovery\ntuser.sys"
del /f /s /q "x:\System Volume Information"
del /f /s /q "yourUSB\System Volume Information"
del /f /s /q "x:\Users\Public\Libraries\collection.dat"
del /f /s /q "x:\Users\Default\NTUSER.DAT"
del /f /s /q "x:\Users\yourname\ntuser.ini"
del /f /s /q "x:\Users\Public\Shared Files"
del /f /s /q "x:\Users\Public\Libraries"
del /f /s /q "x:\ProgramData\ntuser.pol"
del /f /s /q "x:\localappdata\Microsoft\INetCache"
del /f /s /q "x:\%programdata%\Origin -> delete everything expect "LocalContent" folder
del /f /s /q "x:\%localappdata%\Origin"
del /f /s /q "x:\%appdata%\Origin"
del /f /s /q "x:\%homepath%\.Origin"
del /f /s /q "x:\%homepath%\.QtWebEngineProcess"
del /f /s /q "x:\%programdata%\Electronic Arts"
del /f /s /q "x:\%programfiles%\Common Files\EAInstaller"
del /s /f /a:h /a:a /q  "x:\%programdata%\Origin"
del /s /f /a:h /a:a /q  "x:\%localappdata%\Origin"
del /s /f /a:h /a:a /q  "x:\%appdata%\Origin"
del /s /f /a:h /a:a /q  "x:\%homepath%\.Origin"
del /s /f /a:h /a:a /q  "x:\%homepath%\.QtWebEngineProcess"
del /s /f /a:h /a:a /q  "x:\%programdata%\Electronic Arts"
del /s /f /a:h /a:a /q  "x:\%programfiles%\Common Files\EAInstaller"
del /s /f /a:h /a:a /q  "%systemdrive%\ProgramData\Origin"
del /f /s /q "x:\%programdata%\Microsoft\Windows\Start Menu\Programs\Origin"
del /f /s /q "x:\%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Apex Legends"
del /f /s /q "x:\%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\Origin"
del /f /s /q "x:\%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Roaming\Origin"
del /f /s /q "x:\%localappdata%\NVIDIA\NvBackend\ApplicationOntology\data\wrappers\apex_legends"
del /f /s /q "x:\%appdata%\EasyAntiCheat"
del /f /s /q "x:\%localappdata%\ConnectedDevicesPlatform"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Crypto\RSA\*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Crypto\Keys\*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\SystemCertificates\My\Certificates\*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\SystemCertificates\My\Keys\*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\Public\Libraries\collection.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History\History.IE5\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Speech Graphics\Carnival\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\Content.IE5\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCookies\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*"
del /f /s /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys"
del /f /s /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*.*"
del /f /s /q "%systemdrive%\ProgramData\Origin\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Origin\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Roaming\Origin\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\UnrealEngine\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Origin\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Origin\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Electronic Arts\EA Services\License"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Origin"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Origin"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat"
del /f /s /q "%systemdrive%\Users\%username%\Saved Games\Respawn\Apex\local\previousgamestate.txt"
del /f /s /q "%systemdrive%\Users\Public\Libraries\collection.dat\*.*"
del /f /s /q "%systemdrive%\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History\History.IE5\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Speech Graphics\Carnival\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\Content.IE5\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCookies\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Origin\*.*
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Origin\*.*
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Origin\*.*
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*"
del /s /f /q "%systemdrive%\Windows\Public\Libraries\*.*"
del /s /f /q "%systemdrive%\Windows\Prefetch\*.*"
del /f /s /q "%systemdrive%\Intel\*.*"
del /f /s /q "%systemdrive%\desktop.ini\*.*"
del /f /s /q "%systemdrive%paint\Users\%username%\AppData\Roaming\vstelemetry\*.*"
del /f /s /q "%windir%\prefetch\*.*"
del /f /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%systemdrive%\ProgramData\Origin\AchievementCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\CatalogCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\CustomBoxartCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\EntitlementCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\IGOCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Logs\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\NonOriginContentCache\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Subscription\*"
del /f /s /q "%systemdrive%\ProgramData\Origin\Telemetry\*"
rd /s /q "%systemdrive%\ProgramData\Origin"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\AchievementCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\CatalogCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\CustomBoxartCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\EntitlementCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\IGOCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\Logs\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\NonOriginContentCache\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\Subscription\*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Origin\Telemetry\*"
rd /s /a:h /a:a /q "%systemdrive%\ProgramData\Origin"
rd /q /s %systemdrive%\$Recycle.Bin
rd /q /s A:\$Recycle.Bin
rd /q /s B:\$Recycle.Bin
rd /q /s C:\$Recycle.Bin
rd /q /s D:\$Recycle.Bin
rd /q /s E:\$Recycle.Bin
rd /q /s F:\$Recycle.Bin
rd /q /s G:\$Recycle.Bin
rd /q /s H:\$Recycle.Bin
rd /q /s I:\$Recycle.Bin
rd /q /s J:\$Recycle.Bin
rd /q /s K:\$Recycle.Bin
rd /q /s L:\$Recycle.Bin
rd /q /s M:\$Recycle.Bin
rd /q /s N:\$Recycle.Bin
rd /q /s O:\$Recycle.Bin
rd /q /s P:\$Recycle.Bin
rd /q /s Q:\$Recycle.Bin
rd /q /s R:\$Recycle.Bin
rd /q /s S:\$Recycle.Bin
rd /q /s T:\$Recycle.Bin
rd /q /s U:\$Recycle.Bin
rd /q /s V:\$Recycle.Bin
rd /q /s W:\$Recycle.Bin
rd /q /s X:\$Recycle.Bin
rd /q /s Y:\$Recycle.Bin
rd /q /s Z:\$Recycle.Bin
del /f /s /q "x:\$RECYCLE.BIN"
del /f /s /q "x:\PerfLogs"
del /f /s /q "x:\MSOCache"
del /f /s /q "x:\Users\Public\Shared Files"
del /f /s /q "x:\Users\Public\Libraries"
del /f /s /q "x:\localappdata\Microsoft\INetCache"
del /f /s /q "x:\%localappdata%\Origin"
del /f /s /q "x:\%appdata%\Origin"
del /f /s /q "x:\%homepath%\.Origin"
del /f /s /q "x:\%homepath%\.QtWebEngineProcess"
del /f /s /q "x:\%programdata%\Electronic Arts"
del /f /s /q "x:\%programfiles%\Common Files\EAInstaller"
del /f /s /q "x:\%programdata%\Microsoft\Windows\Start Menu\Programs\Origin"
del /f /s /q "x:\%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Apex Legends"
del /f /s /q "x:\%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\Origin"
del /f /s /q "x:\%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Roaming\Origin"
del /f /s /q "x:\%localappdata%\NVIDIA\NvBackend\ApplicationOntology\data\wrappers\apex_legends"
del /f /s /q "x:\%appdata%\EasyAntiCheat"
del /f /s /q "x:\%localappdata%\ConnectedDevicesPlatform"
del /f /s /q "%systemdrive%\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History\History.IE5\*.*"
del /f /s /q "%systemdrive%\Users\%username%\AppData\Local\Speech Graphics\Carnival\*.*"
del /f /s /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\Content.IE5\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCookies\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*"
del /f /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content\*.*"
del /s /f /q "%systemdrive%\Windows\Prefetch\*.*"
del /f /s /q "%systemdrive%\Intel\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.jfm\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Prefetch\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\DeviceMetadataCache\dmrc.idx\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\DeviceMetadataCache\dmrc.idx\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\AMD\DxCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\AMD\CNext\CCCSlim\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\PlaceholderTileLogoFolder\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\CloudStore\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Prefetch\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Diagnosis\EventStore.db-wal\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\perfc009.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\perfh009.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\INF\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\PerfStringBackup.TMP\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\PerfStringBackup.INI\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG2\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\wbem\Performance\WmiApRpl.ini\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\TEMP\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\WDI\LogFiles\StartupInfo\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Logs\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SysWOW64\Gms.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\USOShared\Logs\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\remotemetastore\v1\edb.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\edb.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\CBS\CBS.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\3\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\temp\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AppData\User\Default\Indexed DB\edb.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\meta.edb\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\b05132b02959bc64.automaticDestinations-ms\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\appcompat\Programs\Amcache.hve\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl\*.*"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp"
del /f /s /q "%systemdrive%\Windows\temp\*.*"
rmdir /s /q "%systemdrive%\Windows\temp\*"
rmdir /s /q "%systemdrive%\Windows\Logs"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs"
rmdir /s /q "%systemdrive%\Users\Public\Libraries\collection.dat"
rmdir /s /q "%systemdrive%\MSOCache\{71230000-00E2-0000-1000-00000000}\Setup.dat"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Feeds"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\NetworksCache"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\DataMart\PaidWiFi\Rules"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Speech Graphics\Carnival"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\Content.IE5"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\Local\Microsoft\Windows\INetCookies"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\MetaData"
rmdir /s /q "%systemdrive%\Windows\SysWOW64\config\systemprofile\AppData\LocalLow\Microsoft\CryptnetUrlCache\Content"
rmdir /s /q "%systemdrive%\Windows\Public\Libraries"
rmdir /s /q "%systemdrive%\Windows\Prefetch"
rmdir /s /q "%systemdrive%\Intel"
rmdir /s /q "%systemdrive%\desktop.ini"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\Autom\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\rescache\_merged\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG1\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\ntuser.dat.LOG2\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\settings\Personal\logUploaderSettings_temp.ini\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\settings\Personal\logUploaderSettings.ini\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\sru\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\logs\Common\DeviceHealthSummaryConfiguration.ini\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Windows\WebCache\WebCacheV01.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\BBI.LOG1\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\BBI.LOG2\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\config\DEFAULT.LOG2\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\MoSetup\UpdateAgent.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\PostRebootEventCache.V2\{323558A6-0300-4C3E-97A0-EDEDFEB96B00}.bin\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\System32\LogFiles\WMI\RtBackup\EtwRTGraphicsPerfMonitorSession.etl\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\NVIDIA Corporation\GfeSDK\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\Logs\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\Unistore\data\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Comms\UnistoreDB\USS.jtx\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\ServiceState\EventLog\Data\lastalive0.dat\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG2\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\UsrClass.dat.LOG1\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\Safety\edge\remote\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\WindowsUpdate.log\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\DataStore.edb\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs\edb.log\*.*"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Windows\WER\Temp"
rmdir /s /q "%systemdrive%\Windows\temp\*"
del /f /s /q "%systemdrive%\Windows\temp\*.*"
rmdir /s /q "%systemdrive%\Windows\Logs"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalCache\*.*
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Packages\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\LocalState\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Roaming\EasyAntiCheat"
del /s /f /a:h /a:a /q "%systemdrive%\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.sys\*.*
rmdir /s /q "%systemdrive%\Windows\Logs"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\PostRebootEventCache.V2"
rmdir /s /q "%systemdrive%\Windows\INF"
del /s /f /a:h /a:a /q "%systemdrive%\desktop.ini\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\CloudStore"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\regid.1991-06.com.microsoft\*.*
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\WebCache"
rmdir /s /q "%systemdrive%\Windows\System32\LogFiles"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\History"
rmdir /s /q "%systemdrive%\Windows\System32\LogFiles"
rmdir /s /q "%systemdrive%\Windows\Logs"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\OneDrive\logs"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\Explorer"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Cortana_cw5n1h2txyewy\AC"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces"
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Windows\DeviceMetadataCache"
rmdir /s /q "%systemdrive%\Windows\ServiceState\EventLog"
rmdir /s /q "%systemdrive%\Windows\AppReadiness"
del /s /f /a:h /a:a /q "%systemdrive%\ProgramData\Microsoft\Windows\AppRepository\StateRepository-Machine.srd-wal\*.*
rmdir /s /q "%systemdrive%\ProgramData\Microsoft\Windows\ClipSVC"
rmdir /s /q "%systemdrive%\Program Files\WindowsApps\Deleted"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\SettingSync\metastore"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Microsoft\Windows\INetCache"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\LocalLow\Microsoft\CryptnetUrlCache"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\SLS"
rmdir /s /q "%systemdrive%\Windows\SoftwareDistribution\DataStore\Logs"
rmdir /s /q "%systemdrive%\Windows\System32\spp\store\2.0\cache"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\AC"
rmdir /s /q "%systemdrive%\Users\%username%\AppData\Local\MicrosoftEdge\SharedCacheContainers"
rd /q /s %systemdrive%\$Recycle.Bin
rmdir /s /q "A:\Recovery"
del /s /f /a:h /a:a /q "A:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "A:\MSOCache"
rmdir /s /q "A:\Recovery"
del /s /f /a:h /a:a /q "A:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "A:\MSOCache"

rmdir /s /q "B:\Recovery"
del /s /f /a:h /a:a /q "B:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "B:\MSOCache"
rmdir /s /q "B:\Recovery"
del /s /f /a:h /a:a /q "B:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "B:\MSOCache"

rmdir /s /q "C:\Recovery"
del /s /f /a:h /a:a /q "C:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "C:\MSOCache"
rmdir /s /q "C:\Recovery"
del /s /f /a:h /a:a /q "C:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "C:\MSOCache"

rmdir /s /q "D:\Recovery"
del /s /f /a:h /a:a /q "D:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "D:\MSOCache"
rmdir /s /q "D:\Recovery"
del /s /f /a:h /a:a /q "D:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "D:\MSOCache"

rmdir /s /q "E:\Recovery"
del /s /f /a:h /a:a /q "E:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "E:\MSOCache"
rmdir /s /q "E:\Recovery"
del /s /f /a:h /a:a /q "E:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "E:\MSOCache"

rmdir /s /q "F:\Recovery"
del /s /f /a:h /a:a /q "F:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "F:\MSOCache"
rmdir /s /q "F:\Recovery"
del /s /f /a:h /a:a /q "F:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "F:\MSOCache"

rmdir /s /q "G:\Recovery"
del /s /f /a:h /a:a /q "G:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "G:\MSOCache"
rmdir /s /q "G:\Recovery"
del /s /f /a:h /a:a /q "G:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "G:\MSOCache"

rmdir /s /q "H:\Recovery"
del /s /f /a:h /a:a /q "H:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "H:\MSOCache"
rmdir /s /q "H:\Recovery"
del /s /f /a:h /a:a /q "H:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "H:\MSOCache"

rmdir /s /q "I:\Recovery"
del /s /f /a:h /a:a /q "I:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "I:\MSOCache"
rmdir /s /q "I:\Recovery"
del /s /f /a:h /a:a /q "I:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "I:\MSOCache"

rmdir /s /q "J:\Recovery"
del /s /f /a:h /a:a /q "J:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "J:\MSOCache"
rmdir /s /q "J:\Recovery"
del /s /f /a:h /a:a /q "J:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "J:\MSOCache"

rmdir /s /q "K:\Recovery"
del /s /f /a:h /a:a /q "K:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "K:\MSOCache"
rmdir /s /q "K:\Recovery"
del /s /f /a:h /a:a /q "K:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "K:\MSOCache"

rmdir /s /q "L:\Recovery"
del /s /f /a:h /a:a /q "L:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "L:\MSOCache"
rmdir /s /q "L:\Recovery"
del /s /f /a:h /a:a /q "L:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "L:\MSOCache"

rmdir /s /q "M:\Recovery"
del /s /f /a:h /a:a /q "M:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "M:\MSOCache"
rmdir /s /q "M:\Recovery"
del /s /f /a:h /a:a /q "M:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "M:\MSOCache"

rmdir /s /q "N:\Recovery"
del /s /f /a:h /a:a /q "N:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "N:\MSOCache"
rmdir /s /q "N:\Recovery"
del /s /f /a:h /a:a /q "N:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "N:\MSOCache"

rmdir /s /q "O:\Recovery"
del /s /f /a:h /a:a /q "O:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "O:\MSOCache"
rmdir /s /q "O:\Recovery"
del /s /f /a:h /a:a /q "O:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "O:\MSOCache"

rmdir /s /q "P:\Recovery"
del /s /f /a:h /a:a /q "P:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "P:\MSOCache"
rmdir /s /q "P:\Recovery"
del /s /f /a:h /a:a /q "P:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "P:\MSOCache"

rmdir /s /q "Q:\Recovery"
del /s /f /a:h /a:a /q "Q:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Q:\MSOCache"
rmdir /s /q "Q:\Recovery"
del /s /f /a:h /a:a /q "Q:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Q:\MSOCache"

rmdir /s /q "R:\Recovery"
del /s /f /a:h /a:a /q "R:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "R:\MSOCache"
rmdir /s /q "R:\Recovery"
del /s /f /a:h /a:a /q "R:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "R:\MSOCache"

rmdir /s /q "S:\Recovery"
del /s /f /a:h /a:a /q "S:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "S:\MSOCache"
rmdir /s /q "S:\Recovery"
del /s /f /a:h /a:a /q "S:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "S:\MSOCache"

rmdir /s /q "T:\Recovery"
del /s /f /a:h /a:a /q "T:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "T:\MSOCache"
rmdir /s /q "T:\Recovery"
del /s /f /a:h /a:a /q "T:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "T:\MSOCache"

rmdir /s /q "U:\Recovery"
del /s /f /a:h /a:a /q "U:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "U:\MSOCache"
rmdir /s /q "U:\Recovery"
del /s /f /a:h /a:a /q "U:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "U:\MSOCache"

rmdir /s /q "V:\Recovery"
del /s /f /a:h /a:a /q "V:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "V:\MSOCache"
rmdir /s /q "V:\Recovery"
del /s /f /a:h /a:a /q "V:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "V:\MSOCache"

rmdir /s /q "W:\Recovery"
del /s /f /a:h /a:a /q "W:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "W:\MSOCache"
rmdir /s /q "W:\Recovery"
del /s /f /a:h /a:a /q "W:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "W:\MSOCache"

rmdir /s /q "X:\Recovery"
del /s /f /a:h /a:a /q "X:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "X:\MSOCache"
rmdir /s /q "X:\Recovery"
del /s /f /a:h /a:a /q "X:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "X:\MSOCache"

rmdir /s /q "Y:\Recovery"
del /s /f /a:h /a:a /q "Y:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Y:\MSOCache"
rmdir /s /q "Y:\Recovery"
del /s /f /a:h /a:a /q "Y:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Y:\MSOCache"

rmdir /s /q "Z:\Recovery"
del /s /f /a:h /a:a /q "Z:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Z:\MSOCache"
rmdir /s /q "Z:\Recovery"
del /s /f /a:h /a:a /q "Z:\Users\Public\Libraries\collection.dat\*.*"
rmdir /s /q "Z:\MSOCache"

rd /q /s %systemdrive%\$Recycle.Bin
rd /q /s A:\$Recycle.Bin
rd /q /s B:\$Recycle.Bin
rd /q /s C:\$Recycle.Bin
rd /q /s D:\$Recycle.Bin
rd /q /s E:\$Recycle.Bin
rd /q /s F:\$Recycle.Bin
rd /q /s G:\$Recycle.Bin
rd /q /s H:\$Recycle.Bin
rd /q /s I:\$Recycle.Bin
rd /q /s J:\$Recycle.Bin
rd /q /s K:\$Recycle.Bin
rd /q /s L:\$Recycle.Bin
rd /q /s M:\$Recycle.Bin
rd /q /s N:\$Recycle.Bin
rd /q /s O:\$Recycle.Bin
rd /q /s P:\$Recycle.Bin
rd /q /s Q:\$Recycle.Bin
rd /q /s R:\$Recycle.Bin
rd /q /s S:\$Recycle.Bin
rd /q /s T:\$Recycle.Bin
rd /q /s U:\$Recycle.Bin
rd /q /s V:\$Recycle.Bin
rd /q /s W:\$Recycle.Bin
rd /q /s X:\$Recycle.Bin
rd /q /s Y:\$Recycle.Bin
rd /q /s Z:\$Recycle.Bin

 ECHO.

REG DELETE "HKCU\Software\Electronic Arts\EA Core\Staging\194908\ergc" /f
REG DELETE "HKCU\Software\Electronic Arts" /f
REG DELETE "HKLM\SOFTWARE\Respawn\Apex\Product GUID" /f
REG DELETE "HKLM\SOFTWARE\Classes\origin" /f
REG DELETE "HKLM\SOFTWARE\Classes\origin2" /f
REG DELETE "HKCR\origin" /f
REG DELETE "HKCR\origin2" /f
REG DELETE "HKCR\Applications\Origin.exe" /f  
REG DELETE "HKLM\SOFTWARE\Classes\Applications\Origin.exe" /f 
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.Origin" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\Origin Client Service" /f 
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\Origin Web Helper Service" /f 
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Origin Client Service" /f 
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Origin Web Helper Service" /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications\Origin.exe" /f  
REG DELETE "HKCR\Applications\Origin.exe" /f 
REG DELETE "HKLM\SOFTWARE\Classes\Applications\Origin.exe" /f 
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.Origin" /f     
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93\ac" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93\ad" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181\1a84" /f
REG DELETE "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat\Security" /f
REG DELETE "HKCU\Software\Classes\Installer\Dependencies" /v MSICache /f
REG DELETE "HKCU\Software\Microsoft\Direct3D" /v WHQLClass /f
REG DELETE "HKLM\Hardware\Description\System\CentralProcessor\0" /v ProcessorNameString /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\Package\181\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Index\PackageAndPackageRelativeApplicationId\181^App\93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\3^93\ac" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Index\UserAndApplication\4^93\ad" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Index\PackageFamily\4e\182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\kz2LMQg4+pNfXggv65DcWFQ9SiekWR4B4WMWT+pcqbU: 0x00000002" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\4JSyFFDDKUMXDyK2USgAjbiksFnqOb3f8RPZBPSpEfU: 0x00000002" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\Origins\62bDlCzxB/xxIWLkQdDRYcAqhmZhNOMUtjhRkAgTvkQ: 0x00000002" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Package: 0x00000181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Index: 0x00000000" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Flags: 0x00000000" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\PackageRelativeApplicationId: "App"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Executable: "GameBar.exe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\Entrypoint: "GameBar.App"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\StartPage: (NULL!)" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Application\Data\93\_IndexKeys:  50 61 63 6B 61 67 65 5C 31 38 31 5C 39 33 00 50 61 63 6B 61 67 65 41 6E 64 50 61 63 6B 61 67 65 52 65 6C 61 74 69 76 65 41 70 70 6C 69 63 61 74 69 6F 6E 49 64 5C 31 38 31 5E 41 70 70 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\Application: 0x00000093" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\User: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ac\_IndexKeys:  55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 5C 33 5E 39 33 00 55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 55 73 65 72 4D 6F 64 65 6C 49 64 5C 33 5E 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 21 41 70 70 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\Application: 0x00000093" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\User: 0x00000004" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\ApplicationUserModelId: "Microsoft.XboxGameOverlay_8wekyb3d8bbwe!App"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\ApplicationUser\Data\ad\_IndexKeys:  55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 5C 34 5E 39 33 00 55 73 65 72 41 6E 64 41 70 70 6C 69 63 61 74 69 6F 6E 55 73 65 72 4D 6F 64 65 6C 49 64 5C 34 5E 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 21 41 70 70 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageFamily: 0x0000004E" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageType: 0x00000008" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\Flags: 0x00000000" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\PackageOrigin: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\Volume: 0x00000001" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_~_8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\180\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 30 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 6E 65 75 74 72 61 6C 5F 7E 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageFamily: 0x0000004E" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageType: 0x00000001" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\Flags: 0x00000000" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\PackageOrigin: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\Volume: 0x00000001" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_x64__8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\181\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 31 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 78 36 34 5F 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageFullName: "Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageFamily: 0x0000004E" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageType: 0x00000004" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\Flags: 0x00000000" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\PackageOrigin: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\Volume: 0x00000001" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\InstalledLocation: "C:\Program Files\WindowsApps\Microsoft.XboxGameOverlay_1.41.24001.0_neutral_split.scale-100_8wekyb3d8bbwe"" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\Package\Data\182\_IndexKeys:  50 61 63 6B 61 67 65 46 61 6D 69 6C 79 5C 34 65 5C 31 38 32 00 50 61 63 6B 61 67 65 46 75 6C 6C 4E 61 6D 65 5C 4D 69 63 72 6F 73 6F 66 74 2E 58 62 6F 78 47 61 6D 65 4F 76 65 72 6C 61 79 5F 31 2E 34 31 2E 32 34 30 30 31 2E 30 5F 6E 65 75 74 72 61 6C 5F 73 70 6C 69 74 2E 73 63 61 6C 65 2D 31 30 30 5F 38 77 65 6B 79 62 33 64 38 62 62 77 65 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\Package: 0x00000180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\User: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 30 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 30 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\Package: 0x00000181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\User: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 31 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 31 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\Package: 0x00000182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\User: 0x00000003" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82\_IndexKeys:  55 73 65 72 5C 33 5C 31 61 38 32 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 33 5E 31 38 32 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\Package: 0x00000180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\User: 0x00000004" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83\_IndexKeys:  55 73 65 72 5C 34 5C 31 61 38 33 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 34 5E 31 38 30 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\Package: 0x00000181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\User: 0x00000004" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84\_IndexKeys:  55 73 65 72 5C 34 5C 31 61 38 34 00 55 73 65 72 41 6E 64 50 61 63 6B 61 67 65 5C 34 5E 31 38 31 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\VolatileNotifications\41C64E6DA3D39855:  01 00 04 80 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00 00 02 00 1C 00 01 00 00 00 00 00 14 00 03 00 00 00 01 01 00 00 00 00 00 05 0B 00 00 00 04 00 00 00" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\VolatileNotifications\41C64E6DA3CF4055:  01 00 04 80 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00 00 02 00 1C 00 01 00 00 00 00 00 14 00 03 00 00 00 01 01 00 00 00 00 00 05 0B 00 00 00 04 00 00 00" /f
REG DELETE "HKLM\SOFTWARE\WOW6432Node\EasyAntiCheat" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862software:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_sid:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_classes:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 43 6C 61 73 73 65 73 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\hivelist\\REGISTRY\WC\Siloe6b4a779-bfe1-62d8-47ac-fa19e9becbbecom:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 5F 43 4F 4D 31 35 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862com:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\bam\State\UserType: 0x00000010" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Security\Security:  01 00 14 80 A0 00 00 00 AC 00 00 00 14 00 00 00 30 00 00 00 02 00 1C 00 01 00 00 00 02 80 14 00 FF 01 0F 00 01 01 00 00 00 00 00 01 00 00 00 00 02 00 70 00 05 00 00 00 00 00 14 00 30 00 02 00 01 01 00 00 00 00 00 01 00 00 00 00 00 00 14 00 FD 01 02 00 01 01 00 00 00 00 00 05 12 00 00 00 00 00 18 00 FF 01 0F 00 01 02 00 00 00 00 00 05 20 00 00 00 20 02 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 04 00 00 00 00 00 14 00 8D 01 02 00 01 01 00 00 00 00 00 05 06 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00 01 01 00 00 00 00 00 05 12 00 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862software:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_sid:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862user_classes:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 55 73 65 72 43 6C 61 73 73 65 73 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\\REGISTRY\WC\Siloe6b4a779-bfe1-62d8-47ac-fa19e9becbbecom:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 5F 43 4F 4D 31 35 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\hivelist\\REGISTRY\WC\Silo19faac47-bee9-becb-79a7-b4e6e1bfd862com:  5C 44 65 76 69 63 65 5C 48 61 72 64 64 69 73 6B 56 6F 6C 75 6D 65 33 5C 50 72 6F 67 72 61 6D 44 61 74 61 5C 50 61 63 6B 61 67 65 73 5C 4D 69 63 72 6F 73 6F 66 74 2E 53 6B 79 70 65 41 70 70 5F 6B 7A 66 38 71 78 66 33 38 7A 67 35 63 5C 53 2D 31 2D 35 2D 32 31 2D 32 35 33 32 33 38 32 35 32 38 2D 35 38 31 32 31 34 38 33 34 2D 32 35 33 34 34 37 34 32 34 38 2D 31 30 30 31 5C 53 79 73 74 65 6D 41 70 70 44 61 74 61 5C 48 65 6C 69 75 6D 5C 43 61 63 68 65 5C 35 63 38 63 62 62 36 61 61 37 65 61 31 34 32 34 2E 64 61 74 00 00" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\EasyAntiCheat" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Data\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\3\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\User\4\1a84" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^180\1a80" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^181\1a81" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\3^182\1a82" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^180\1a83" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\StateRepository\Cache\PackageUser\Index\UserAndPackage\4^181\1a84" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Type: 0x00000010" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\Start: 0x00000003" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ErrorControl: 0x00000001" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ImagePath: ""C:\Program Files (x86)\EasyAntiCheat\EasyAntiCheat.exe""" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\DisplayName: "EasyAntiCheat"" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\WOW64: 0x0000014C" /f
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\EasyAntiCheat\ObjectName: "LocalSystem"" /f
REG DELETE "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher" /f
REG DELETE "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
REG DELETE "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
REG DELETE "HKU\.DEFAULT\Software\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
REG DELETE "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher" /f
REG DELETE "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
REG DELETE "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
REG DELETE "HKU\.DEFAULT\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\0" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000205B6" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000403D6" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000405DE" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:0000000000060286" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:000000000009042E" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000A03B4" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000A0430" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000B0532" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000B05D6" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000C0430" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000C0586" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000E03D2" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000000E0406" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:0000000000100430" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000001103EE" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:000000000011041E" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:000000000012047E" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000001303EE" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000001304F2" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:000000000014041E" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000001703E6" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:0000000000170440" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\ApplicationViewManagement\W32:00000000001704FC" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /f
REG DELETE "HKU\S-1-5-21-2532382528-581214834-2534474248-1001\Software\Classes\Local Settings\MrtCache\C:%5CProgram Files%5CWindowsApps%5CMicrosoft.XboxGamingOverlay_2.26.28001.0_x64__8wekyb3d8bbwe%5Cmicrosoft.system.package.metadata%5CS-1-5-21-2532382528-581214834-2534474248-1001-MergedResources-2.pri" /f
REG DELETE "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher" /f
REG DELETE "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
REG DELETE "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
REG DELETE "HKU\S-1-5-18\Software\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f
REG DELETE "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher" /f
REG DELETE "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\Certificates" /f
REG DELETE "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CRLs" /f
REG DELETE "HKU\S-1-5-18\Software\Policies\Microsoft\SystemCertificates\TrustedPublisher\CTLs" /f  
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Installer\Dependencies" /v MSICache /f

rmdir /s /q "C:\Users\%username%\AppData\Roaming\discord"
powershell -Command "& {Get-AppxPackage -AllUsers xbox | Remove-AppxPackage}" >NUL 2>NUL
sc stop XblAuthManager >NUL 2>NUL
sc stop XblGameSave >NUL 2>NUL
sc stop XboxNetApiSvc >NUL 2>NUL
sc stop XboxGipSvc >NUL 2>NUL
sc delete XblAuthManager >NUL 2>NUL
sc delete XblGameSave >NUL 2>NUL
sc delete XboxNetApiSvc >NUL 2>NUL
sc delete XboxGipSvc >NUL 2>NUL
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /f >NUL 2>NUL
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\INextUUID" /f 
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f >NUL 2>NUL
reg delete "HKEY_CURRENT_USER\SOFTWARE\CitizenFX" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Discord" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Valve" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\nk" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\FiveM" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Rockstar Games\InstallGUID" /f /v gta5 /t REG_SZ /d {39f126d9-a4ba-445b-a054-0e922710a4f8}
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /disable >NUL 2>NUL
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable >NUL 2>NUL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >NUL 2>NUL
rmdir /q /s "C:\ProgramFiles(x86)\Steam\userdata"
del "C:\ProgramFiles(x86)\Steam\userdata"
rmdir /q /s 
del "C:\ProgramFiles\Rockstar Games\Launcher\ThirdParty"
takeown /A /R /D Y /F C:\windows\temp
icacls C:\windows\temp /grant administradores:F /T /C
del C:\Windows\Prefetch
md c:\windows\temp
del c:\windows\logs\cbs\*.log
del C:\Windows\Logs\MoSetup\*.log
del C:\Windows\Panther\*.log /s /q
del C:\Windows\inf\*.log /s /q
del C:\Windows\logs\*.log /s /q
del C:\Windows\SoftwareDistribution\*.log /s /q
del C:\Windows\Microsoft.NET\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\WebCache\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\SettingSync\*.log /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp /s /q
del C:\Users\%USERNAME%\AppData\Local\Microsoft\"Terminal Server Client"\Cache\*.bin /s /q
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\FiveM.app\data\cache\
rmdir /q /s C:\Users\%USERNAME%\AppData\Local\DigitalEntitlements\
del C:\Users\%USERNAME%\AppData\Local\DigitalEntitlements
del C:\Users\%USERNAME%\AppData\Local\FiveM.app\data\cache\
rmdir /s /q C:\Users\%USERNAME%\AppData\Local\FiveM.app\logs
rmdir /s /q C:\Users\%USERNAME%\AppData\Local\FiveM.app\crashes
start steam://validate/271590


echo Uninstalling FiveM...
taskkill /f /im FiveM.exe /t
taskkill /f /im FiveM_ChromeBrowser.exe /t
taskkill /f /im FiveM_DumpServer.exe /t

:: Get uninstaller path from registry
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\FiveM" /v "UninstallString" 2^>nul') do set "UNINSTALLER=%%B"

if defined UNINSTALLER (
    echo Running FiveM uninstaller...
    start "" /wait "%UNINSTALLER%"
) else (
    echo FiveM uninstaller not found in registry
)

:: Clean up after uninstall
del /s /q /f %LocalAppData%\FiveM

REM Delete FiveM Audio Policy Registry Keys
for %%i in (
    10de63e7_0 119040f_0 1684579f_0 1b241367_0 1cd918ac_0 1dfe8e66_0 2649b777_0
    28389348_0 28530eec_0 2ad2996a_0 2c9e7884_0 30d1bdfe_0 31485eda_0 32adb6f2_0
    36ebc0ac_0 36f8a61c_0 38186ec4_0 387835cb_0 3d5f5a22_0 3e775a5f_0 44915d0d_0
    4c53ca5_0 4c57143c_0 4e3cba37_0 4f189036_0 4f77c66b_0 53d99412_0 55d2dc5c_0
    598db3e0_0 59fcb09d_0 605171aa_0 626260aa_0 643f5710_0 6793f8ac_0 6bcb67ea_0
    6c60e378_0 6cd78454_0 6f915c2f_0 73ad1fee_0 744a16fc_0 771286a8_0 77892784_0
    7a067fd9_0 7ab99100_0 7d0bc156_0 7da42f3_0 7dce33b_0 7f56bc07_0 81efb35d_0
    84b82309_0 8918737e_0 89cbdfb1_0 8d8cc098_0 8debb3e_0 8e036174_0 947d82e1_0
    9555c1a_0 9b325cf9_0 a3ebbe44_0 aaf7bcd1_0 ada713e6_0 afd93c76_0 b10b763e_0
    b309b52d_0 b6beeddc_0 b7358eb8_0 b9c03b28_0 ba8adfa6_0 bd7ed8d7_0 bff6d6d_0
    c4648a3d_0 c8307c07_0 cf2b8eb8_0 d1051996_0 d429ea15_0 d48710d4_0 dc678d8_0
    deaab5f7_0 e0a03816_0 e225780e_0 e75a406c_0 e7d0e148_0 ec9a9bb8_0 f37367ae_0
    f3ea088a_0 f4ffdccd_0 f60b8ba6_0 f71e9178_0 f74c3ee8_0 f75a4db_0 fa3746da_0
    faa1d27_0 fc604cb3_0
) do (
    reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore\%%i" /f
)

REM Delete FiveM Firewall Rules
for %%i in (
"{726D52BA-CEB7-4381-8AA8-D943299C4EE0}"
"{A7DF312B-1B7F-44A2-BF7D-1992313B9512}"
"{85E88CDE-DCC3-4742-BD3F-274FEAEB1162}"
"{A8B10E25-2253-4F99-876D-9B84C74439CD}"
"{B810657C-7358-4006-B2E8-264DC1DA8AD7}"
"{4D8F53F2-94A0-4F7C-8386-AD09B2CEFBC1}"
"{DE87152C-F607-44E0-81C5-EB1E495CC12B}"
"{4665466A-613F-486F-9E07-A50A47103855}"
"{280C1315-19D5-4489-ACE3-980AE89CE422}"
"{955664AF-7EC8-4326-AFBF-7A4FDF023EB0}"
"{4AFD5164-56C5-4749-9CF4-21C82A2C0EA3}"
"{1FF17780-D409-45C8-A621-38B10E619FB3}"
"{F9210579-C958-4022-ABA4-4A25C19B2A5E}"
"{0449807C-AE5F-424E-9E51-801D34A77688}"
"{CF81E544-FE0D-4B2C-9359-CEE07042718A}"
"{C50C44ED-14B8-4B9B-A131-F2AE083D5786}"
"{6921C6C6-7D9E-494F-9106-0033AE71BC3D}"
"{7CDAAF27-B7C7-416D-BE48-929BDFA3ED96}"
"{D30BE1D9-5B38-452F-B1C2-41E79130B669}"
"{3E810B4D-98F3-42EF-9D92-E806143F61B0}"
"{FABE1DB0-03A4-47EC-BE80-2180CBAC547D}"
"{571B9D87-2EFC-4D02-86C1-D1AED5F2550D}"
"{7A3099DF-AB8E-44D7-894B-407C1C81089D}"
"{8D65B3BE-BCFC-46AC-9159-0FE83884129D}"
"{3DE3D08F-4677-4E23-9190-BCCCFD4F9964}"
"{5A1AF229-4AC3-468E-9A81-26AE5C4BE5C1}"
"{81D11191-EF8C-4AB2-A390-4E5860570645}"
"{53F36A07-68C3-41EE-A980-C9D4F8BE54B8}"
"{416A674E-67D9-42C9-B8B7-30F15B6CE6F9}"
"{BB94D3BA-D66B-47A1-8F65-006831A16791}"
"{00C655ED-2E3F-478B-B4F2-6F029129F8E7}"
"{7CC5F80F-EFF2-4910-B248-600C71C60C06}"
"{DC18F75B-6357-400F-8EC8-CC54510D941C}"
"{31A20BA2-B163-4DFD-9D42-9948E3BAD023}"
"{AA235D08-4EDB-48B4-962E-8D0D517495B6}"
"{42CB1EC7-125C-407E-8B16-0E410D942340}"
"{4F10F6B8-F34B-4E44-A899-D38543D3BA1E}"
"{24EC42F4-508A-437D-AF90-4FF97A9D8A76}"
"{A8E18D28-691A-4428-9CC6-CB22CA79DDCA}"
"{321B547E-55D7-4D00-8B47-46D9FBF2C866}"
"{33D03E99-DA47-47EC-A94F-370C13A7BB6F}"
"{EFF2BA5A-F804-4A46-A6F5-EC52D28FB5E5}"
"{34B83A05-D2F4-4814-959D-51BB289FEDB8}"
"{66B936BD-574F-4A5F-AAD8-425AFB8129E3}"
"{A3D8B921-6E78-42BA-A337-BC40BA4631AD}"
"{02307B69-BA65-462E-B735-C44D45D31105}"
"{1D3C411C-720D-495B-86CC-1CD7115686E1}"
"{E1CAB1FC-779E-4843-8DC9-2B55CD2AD932}"
"{59462C30-58CB-4FF6-AC27-9F90B4FF3468}"
"{E616A4F2-DFCD-4353-BDA1-36E89C6BFEBF}"
"{4CE9D7DE-DD1B-408F-A49A-D5C795E88DA1}"
"{786A6A71-A68E-4507-87C0-6F56FE3FED93}"
"{59022CDC-4B0C-4A05-BA0E-12BC6B5DEF87}"
"{A446C3F3-568C-4DCF-A2D9-D38DA812ED99}"
"{1A994C62-85B3-4279-BCC9-1F4829B9F065}"
"{B096D8A1-635C-4C27-8B88-F82E8B125379}"
"{A99AC18E-522C-4D46-B5FC-0658A3020253}"
"{8D51F095-06CE-4F3B-BEB8-77F608FA5763}"
"{84325510-928C-4310-89C5-BB8E7A4BD3D8}"
"{44710DF5-93E5-46D4-ADAE-A8307AAD12FE}"
"{2ED5E983-B0FD-4A6C-A6DB-80F227C4489D}"
"{3FF0234D-EF20-4FF8-923C-0C60BEAFB7DC}"
"{712DC92D-0FC9-488C-92CB-984366F957B2}"
"{2AB63739-AE12-4737-9DAD-B2304C5E6045}"
"{0C9C6D64-5706-41D3-99BA-7436C86217E3}"
"{626764AC-2180-4612-B3DF-5F3207A16F7E}"
"{117FEEDA-8DAA-45C0-B080-A65D365AE3F7}"
"{DA23A6DA-E75F-4504-9919-1A609C0BD569}"
"{62F94B5B-72C8-4A4B-A4EF-2DBC8C438675}"
"{A94D5F71-A7C4-4DD5-9ED5-8B3FDF92F41E}"
"{8C9219D3-C2F9-4395-A9E7-471B305C34F3}"
"{3393DEA7-E982-42A2-BA1A-BBC2A9F9B37E}"
"{8AABB871-8671-47B0-BAE0-73FE993F6C7D}"
"{E7BED149-E72C-4FDB-A025-B632B1A704A3}"
"{AF5CEC2F-DE3D-4F99-A4E3-79E205F523CB}"
"{F35ED66B-3C37-4D55-89BE-164982F8210B}"
"{149A45B5-2727-4356-B0D5-009A92A03D9F}"
"{6D5E7B49-B0C9-45DE-B111-6AC678EDB5D7}"
"{83A9A50D-86E3-47C0-9122-F8A28565C58E}"
"{ECB03A70-9DC0-48B3-8C34-8E637BF4819E}"
"{3F300B3A-1B3E-40FC-9CDE-F217C2A37656}"
"{4D36C90D-9E14-4220-95D6-764ED5A1F639}"
"{A1322E4C-5EDD-4AAB-9467-0FE4E13C9F45}"
"{35398D3F-53B0-47E3-BE17-9F691B9129BE}"
"{E96B6F90-2EF5-4D1F-BDF3-B5A5E09E442D}"
"{44390B46-090B-462C-B5B0-AC7A6F852BC8}"
"{2210BADB-0873-408E-8D77-74C0F5A27E48}"
"{3764DA97-B9FE-4D0D-A947-031C9D16ABAD}"
"{C14BE22B-288D-487D-9A79-56CD1115C6B5}"
"{30353426-4603-4865-96D9-437FF32AFFE4}"
"{EA33CC45-4D97-4355-B0DF-23608341785F}"
"{BB934217-2741-46A5-9346-3A71455FDFD7}"
"{E068E87B-284D-4B70-A9A5-4E1459578D3E}"
"{C7FAB9B0-742D-4230-995C-361B59956C01}"
"{FA1B95B3-5CDB-433E-95C9-EEB23B9E69D0}"
"{A28F70A5-7901-4D48-8428-BABBE7216382}"
"{CE8512DE-359B-4351-AAD3-FDBE436DAE65}"
"{42901DD4-1B13-415D-B462-C4161D1F05E3}"
"{E1878DB0-9981-4EB9-A36B-4EC0E66AB7EB}"
"{35F0553E-0D30-4DEE-ACE9-5AC384364B6A}"
"{BF082F93-B6D5-458E-8655-F9A60EB735AD}"
"{3358EB70-FF0B-476E-B0C9-71A4361F1A5C}"
"{D8A3AE10-C0D7-4B69-B764-3FB5E08AF456}"
"{418142A4-C712-487E-8A03-AE4056B2165F}"
"{020B1FFA-8552-47C2-9702-A508C0504C91}"
"{5EC52DB4-3835-410B-8833-C3581EED9C5A}"
"{5EAA9BF1-FBDE-43EC-BCBE-46B2D320F40B}"
"{FD5470E2-ADE6-44AB-A9C6-BF33F36704F4}"
"{FF1AB5AC-4B3C-4033-A891-0B2AE59738C5}"
"{F6B99FC5-4D34-40E5-A2CE-9BA548F00F21}"
"{44D75C9A-980B-41F8-9C68-116F8F3D7508}"
"{A923292C-4CFB-4DCF-A1EE-AD9EA2A5015D}"
"{8F30C536-215D-4A2C-B67C-DCE2ACC4C47E}"
"{C5F605AA-8977-4D5A-9446-93FABA344122}"
"{B2650C97-C332-4187-B5B1-0BEABBF20801}"
"{3E179BF7-A27B-4D57-9484-3A7C3B876FA0}"
"{E05E62E2-1865-482A-8257-6FB68A200E64}"
"{57485567-2B99-42E4-BB39-F4F335147C9D}"
"{BC28A2B7-D92A-4FB4-A55E-6A3A3FF9BEE3}"
"{654DF13D-5C5E-4FDC-8D36-0DE50AD021F0}"
"{76EC2514-4963-4700-B14B-96F5B57F77F0}"
"{E52E29B6-F104-403A-B8E9-BC0150D4D08B}"
"{E37CB8E3-6C2F-4117-945F-9CBF17725187}"
"{82F70AAE-CD22-40BF-A15A-EACF9982F570}"
"{01617285-BC17-4D18-BCA5-E63BB2EC4EC0}"
"{45059223-5804-4386-AEE6-39BCF0C22E51}"
"{582DDD45-3946-4803-B8D5-7EFA121D1CEF}"
"{029A9E55-D827-4E36-834E-3D5FCCEA5F48}"
"{4BC9D305-706D-4C97-B9F8-EB517880C922}"
"{A8A1CA26-0440-40A5-B589-B7AE14C68E34}"
"{F839567A-CFC7-42E0-B4F4-0CC8199CBD8B}"
"{C28BE0A4-49F6-4F0A-8340-DF3691C35B47}"
"{979ED9D1-F232-4985-A511-4F6D875B5CC1}"
"{3B0C1552-7E66-41D3-B14F-CC7FB93AB809}"
"{3B5BA04A-5E4C-4A82-8AAE-8B36C851A594}"
"{B805FCAB-0446-4694-8ED1-FA55205A719C}"
"{6587A3B7-B798-4804-97A5-A59239143007}"
"{FA1F08CC-48FE-4FE0-929B-D6A2CF3FC31E}"
"{1AB86822-930E-4711-8BF3-B0349351BB30}"
"{17D9B280-82FE-4A62-A78E-F91F96D05B94}"
"{82C07155-AF41-49CD-90F4-CC7AB3D8495A}"
"{526DE26A-5B15-4D15-8895-E17C1E856CDD}"
"{C8F562A0-0ACC-4EF7-9505-5D515FCA9733}"
"{74775734-A5F3-484E-80DD-283C55F4563D}"
"{2B17606A-6BE3-43E3-B00F-A919E6B22D49}"
"{D7C0F25B-54B5-4E34-9ABF-6C66D33BEAF0}"
"{E0BB948B-E620-403A-B79B-F5F116EB3454}"
"{B0D8F7E2-5C25-460B-9FCB-446991110A75}"
"{BF6E77D9-A08B-45EC-BA02-9D6D49713BA0}"
"{57671B25-B266-42F8-B9C2-C7AB29C8B295}"
"{5091669F-0836-4C8A-A798-FFF01A6DD22A}"
"{F203D3E7-098C-480F-BC8E-3DA2162AAF65}"
"{F6915633-E411-4CE0-B895-AA237673A89B}"
"{1541DFDB-5C6E-4CC0-899D-AAC2EDD9D959}"
"{1C209E61-1480-429D-B181-1F6EA735976D}"
"{755ED0DA-39BD-4461-B0AE-79A463218D84}"
"{982705C9-15E5-46EB-9C3B-382EA54245B3}"
"{0433F3DA-4738-4799-AE3F-916FBB0B314A}"
"{97F28545-F224-43F6-9C8F-9C98AD56636E}"
"{273380B3-2B0F-4211-AA34-5D11CC6FCE28}"
"{95A3E63C-C692-4CB8-9564-67B3E00F3FAF}"
"{309D9F30-5928-4F76-9039-2812C3210D9B}"
"{1CC84FEF-2603-452F-A1A0-F025CFCE6EDC}"
"{5BA4D4F9-4648-41EC-B2CB-35B19ED1D899}"
"{613422D3-0EC8-48BA-BD7A-E7E9CE7E7F49}"
"{6AB3EA27-87F7-4F15-8A58-2C73C3B01347}"
"{45D82804-7F8E-4EFB-BD99-000751C54673}"
"{A06F3080-194C-4F75-BF19-5C1D0F33704E}"
"{3827AE04-DE8A-4782-AFB0-336EAE86E8C6}"
"{B72AB662-A37E-4BDB-B3A6-BE2DE5971B23}"
"{9BD6B5E1-E251-4BAD-A417-AAF714261CCF}"
"{8A608888-1011-4FBC-95FE-5783C6A6BFD3}"
"{FDF5F11E-1B3A-4515-9BB9-AED2568D8BF3}"
"{F79053AA-1C9E-41E3-BC19-8EEEC283ADDB}"
"{62F1493D-B2D1-4B7F-978F-B4A5794F0B21}"
"{0F4E580F-2074-4750-9DB3-3B71CA497ABF}"
"{FE67A9A0-56B7-4C17-BB48-ACB4B9288684}"
"{3DA4D4B4-7D7E-4811-BEEA-0F9F2D1881D5}"
"{22540827-7BF0-4827-910F-4BB427AECEC9}"
"{CD8B6DAA-8254-47CE-9031-9CBF54071D4F}"
"{15ED01E9-AE7D-4E29-A877-8FFE6EAB0CEC}"
"{8CE9B2BE-AD8D-46F0-99DB-BD598BFF4761}"
"{841CCD56-7400-427F-9010-D1901FC3958F}"
"{296A34CA-B048-4D5B-BB22-2EAED391FC6F}"
"{DC512A44-F46D-4D2A-8C9D-40BDEEB5A954}"
"{D6463074-CC5E-4FC0-B8B8-FC6F8479AC07}"
"{DC52E47C-859D-4D2B-9D5B-23C30C95C8AF}"
"{9ACE8DD4-B3CC-4E54-921A-31035C37A92B}"
"{7F51BB9A-34AF-4DF7-8324-3300D3CD4B52}"
"{61AA8B3C-9E65-489A-B282-B0356825400E}"
"{C9545BED-4879-433D-A04D-7E88E496E170}"
"{D40B3F17-452F-46FA-9E93-315D514D1676}"
"{753AC0C8-437E-4C08-A7CA-B2350A8CAD31}"
"{CD736B22-F663-4CF2-B1B6-9F5465E2D5D5}"
"{974742CB-C992-461B-92C2-1C29C6BB3E45}"
"{84AB719A-F86E-4700-AB4F-D57808BDC4EB}"
"{4DA57C75-DB6A-4590-817A-EA765E1F8535}"
"{B32BC479-F0E0-43FB-8414-89B0FFEA6D12}"
"{688EDE32-7D2B-46F9-94B2-F346640CB0D2}"
"{90876DFD-EAF3-4542-B485-D5F0A2D39A66}"
"{C7A37123-4E68-4FFF-BDC9-215186787BDC}"
"{59355652-3205-4693-A5C8-F3818DA4F349}"
"{F0B6DA24-78C7-4125-B67B-277D2B84B279}"
"{16DA74B0-C7FC-4F66-AB00-5010CC0CB994}"
"{0105DC7B-2937-4717-B96B-CB927E632304}"
"{FCEC5EA2-00D8-4E01-A2EF-54C6A9C237E2}"
"{28A5A2C6-D05B-4B31-B684-33A9BAAEEB7E}"
"{05B07A9F-5FD6-4746-A331-47D5D89E68F9}"
"{14A9B86D-42B7-4CE7-8200-D7120CDDD9E7}"
"{6061E99F-E01D-47E4-8FF8-03C170E39372}"
"{DDCE0743-7612-42C2-B203-87F6A059A615}"
"{9961D15A-7F7B-4261-A089-E739A5D9A8BC}"
"{8E7DB531-ECCF-456A-AE8A-54ECE6913D87}"
"{A3EDD46F-3DF9-4DB5-9408-7C418317E799}"
"{404199D4-5D45-4BBF-93D6-03A0C4FF6A5A}"
"{F3D48449-A330-432C-B6B0-A3DCC193B9C4}"
"{94714FDE-B0AF-4B23-9F5E-FDCD7157C191}"
"{9963A14C-DB43-4209-BD6A-9488ACEDEB1A}"
"{E7E6C16A-714C-4DAC-9D5F-7D14DC060E55}"
"{FBE1E32E-FE2A-470C-A814-072D941101CB}"
"{C72DBC92-E376-476F-8326-C609C02E3749}"
"{ED17934F-6E4E-4713-85A2-18415E959A2A}"
"{2BCC36F0-8819-4B8F-A357-42F78E1E3EA0}"
"{2E24DA67-4335-4BA0-BEDA-B7B09C5CF6C8}"
"{5ED3D421-0A6A-47E6-A57D-8C1157035ED0}"
"{D0A6779F-7EB9-4A13-9539-523A96248C3E}"
"{55B2A056-7860-4890-BC83-076A3CDF7402}"
"{5CE64540-A0A6-494A-BD3F-C3CF108884FD}"
"{6DE52BB2-ADE6-4139-ACFC-FA5DB6248422}"
"{43DCC947-BDBC-41AA-83E0-60A90FEE105C}"
"{279BB688-EF6C-4EA4-B39A-9B8702674D6D}"
"{51BF5D99-32B5-4C53-8E2E-6D889ADDF1D3}"
"{E139F83C-8E8B-45FF-B826-20A9EBC06859}"
"{2B26D7CE-D46D-4BE7-8C16-29A9A226BDE0}"
"{761B1659-2F38-4E22-9059-5EEADE5AD04D}"
"{F3153A52-CCCA-4607-9941-5E8F94736AA5}"
"{6997CA16-F7A2-4FCE-9DFC-0B694EBA100C}"
"{A12A8525-013A-4307-ADE9-3209F1F2C7C9}"
"{382A46DB-2942-4DC2-A4B7-651B52DB54A9}"
"{B61391DE-C691-46F2-83C9-CC981C1C3248}"
"{0CE6DD27-3547-4783-AE09-FEB07C446145}"
"{9A66CA00-111D-4C3D-A5CC-A5B3093E86C4}"
"{DCCD501D-DAF7-4696-AA80-C7E3E738B259}"
"{62925252-99CE-40B8-A8A1-281C0F316722}"
"{E4FBFD0E-35D7-44AE-8B52-4CBECDF5FF53}"
"{4A466728-4AA7-4B22-AD28-87F9A4DC0780}"
"{01A4D03C-38CC-4663-AF44-045B08C80DA4}"
"{F43F2488-8512-4F1A-99AB-FA265766559B}"
"{42E679DE-7772-47F1-923A-04A0C60ABABA}"
"{E58E6D4D-59B3-4197-9804-7AE4706FB3C4}"
"{332F2C6A-8E59-40EA-98F9-9C8F55B5FA21}"
"{1757CFE6-60CE-4384-9DAC-768FAAF336BB}"
"{D46FD8E2-0B04-4425-8141-04FC0945D7D3}"
"{20BB4A04-C018-4CCF-A416-7411CDE42060}"
"{EABF709C-24BD-4F11-9E54-FC355182654C}"
"{C4CA3389-FB1B-4065-B113-3369543DE5ED}"
"{29A8E892-491E-4726-9B6B-CC2FA7C5C44F}"
"{DCE15485-C40F-4E33-ACDE-35CAD67A0113}"
"{607FDF6A-B86F-4367-910F-6FEE113537C0}"
"{4419DDEC-9E66-4C2E-BE2D-2C9E2014B302}"
"{A46AEE28-D136-4199-971D-05AFE0FEEE62}"
"{479739E5-8C92-4894-AC44-1FD344BF72E9}"
"{99C5BDCD-E980-445C-8610-1113C2AE3A83}"
"{A57E5317-CC3B-49D0-986D-7F083FF1EED8}"
"{1A136C8F-9BF7-4099-8FB8-C7DDCDDC3AF7}"
"{539E1556-F340-44A0-92D3-FE6FF6758B76}"
"{623F9EB2-0024-4AB4-AFD0-B91DBBBDBD05}"
"{019F83A7-2020-4673-A407-AB587E8D022A}"
"{605156E4-E948-4FE3-B1DB-053BBB4EA7AC}"
"{B5B98A83-8B81-484A-AA63-F0AF99DE9D6A}"
"{3E0E437F-936C-4E57-A4E1-4B4E2E54E2F2}"
"{2F366124-3372-4F61-93D3-227A9CA09EDE}"
"{83227B63-6AA9-4337-A81B-3889AC55F1EB}"
"{4D1C2C78-8465-405E-9ADE-96B015020011}"
"{F1D1CF5F-77AF-4EF0-B01D-45A54DD6710B}"
"{EA2CEF56-2F73-480A-A6BC-CADE1A3DD75A}"
"{574C25BF-4979-45B3-9E6E-40A708A5660B}"
"{BAD6E930-6282-442C-B8A1-CF6157426262}"
"{9A8937EF-A8BB-49CD-9A7E-27E38A979DE0}"
"{D79FAC8F-BBEB-4C42-9823-82ACCD48A04D}"
"{E54FEBE6-BE8D-4934-B454-D5E1ACEB9939}"
"{39E3FE5A-8509-47C8-8BBA-9C3AA4397EE6}"
"{1A642C01-098E-4FF0-9A87-3559707158CC}"
"{DB961DC1-1910-4E5C-9D62-4170B8DF7B3B}"
"{5F542386-9E57-484A-BCE1-BF9723834784}"
"{B1AE94FA-9CD6-4026-9391-B00EFE30D579}"
"{474EA9DD-4A72-4390-8CEB-23BB6A960200}"
"{90DE4087-DB86-4AD8-96B0-83FC4C888C45}"
"{1084E0AB-872F-4BEF-B800-D6D715EB6A06}"
"{17BBE790-9443-4BC7-B9B8-F6943336CC2D}"
"{E14C31E3-3EFB-4FFD-855E-8701DEAD9AE7}"
"{E3291B15-DDEC-4FA0-AC8C-194461448D9C}"
"{8D00C1C8-41F0-4C20-A238-3D7A9056ABDF}"
"{B3C065C7-2B5B-4ABE-B9FA-AF3B5D033E93}"
"{8B9CC48B-8871-49D0-87E0-A9C336AA4885}"
"{A1CD5A9F-76FF-4E0D-A5DA-AEBD9A18B3C8}"
"{35000E68-38CC-421E-9AC9-52C7F6227F94}"
"{90A3E8B2-9A8E-4BCE-860D-A613207FE606}"
"{215CAF56-788F-40E3-939F-C3235DC4CF81}"
"{8547EFDB-B2F3-41D5-96AB-0C87E5628755}"
"{80451FD7-6098-4A3E-937B-ED61AD66C975}"
"{BD2D37C3-A38F-4D2E-B865-F8DB5B02A785}"
"{6054DE3D-FC2A-48EB-9993-0DCAD14F0111}"
"{2D8BB5F0-9196-485B-B1C4-F13999CAE586}"
"{EE5E754A-28C9-4F87-99E5-F3CFB75D9774}"
"{8CCD5F30-9D0E-4A00-B483-6EA28E50FFA0}"
"{B632B25B-5A98-4707-B2CC-523C84CE7F5C}"
"{1FA1D664-2FFF-4DB2-BC5B-B42377A32590}"
"{CCB99389-F533-4481-B2F1-DC397C5EBF35}"
"{C765750F-4BE4-4478-B38E-457664D0D956}"
"{3BFA8602-1D3A-4210-B24A-93E1842EF508}"
"{07C54492-C21E-471E-9E09-6600B9FD1F36}"
"{685AF392-C3F3-4F69-BBE8-1186A967B16B}"
"{2C0B9230-0399-473B-B57B-2D34055A07C2}"
"{71703046-37C7-4A28-A519-E7531B63185A}"
"{EEDCA9CE-6DA5-4559-9DCA-1DF78D2D594A}"
"{A947494D-C3D1-4C54-906E-E62312D11446}"
"{6911AE78-615B-40C8-8E61-1E05F45206AD}"
"{BAFD985F-5560-4A26-9322-4B54B78BABE1}"
"{3500F24A-3062-465D-AC19-8809203445C6}"
"{71022187-F98B-4532-AAA2-6ABD1150313F}"
"{4C264F4C-FE06-449E-B0B4-C82003FABEF6}"
"{92981402-BB6F-4719-858F-23A9F17E7C6D}"
"{71C210E0-CC24-4F9F-BA2F-DDDD6244BF5E}"
"{1423F711-E3B6-469F-A2B1-21275DE78105}"
"{CDAD04E3-50FE-4C8A-8C46-EA285AC546B0}"
"{722F6DA8-A90D-4D5B-9932-103FD53C7D2F}"
"{D4F78446-BF28-4BD0-AB17-E962557B23C0}"
"{5D934C7C-F808-4536-9ADB-83271E592F93}"
"{5440EE47-440F-4C46-9956-AC757B031B58}"
"{9EE3536D-20E9-4928-A10A-FE1550C4DA79}"
"{6CA27F29-FA0B-4A4F-804A-5660D0C2D727}"
"{EA991D05-1807-40FD-B234-0AFC14261B1F}"
"{180222D2-5505-499F-A25E-B87FEB3BFEBD}"
"{D2BF35C3-DDD4-4702-9FC0-3BBF2C35B780}"
"{081D7E41-31C3-4DC7-8221-42E16C196D75}"
"{81283373-FCE3-4546-927D-02E53ED4CC54}"
"{5A92A825-5897-4EF5-943B-3C175026EF72}"
"{06B670FF-0903-4ED3-A7B9-3B31C2991321}"
"{79CBF502-315D-4917-AAD4-4F83D696F3EE}"
"{4C3FD478-ACA1-4D40-8718-EE7F2376E619}"
"{9583F628-DA03-4AA6-AA3B-BCCD996F3300}"
"{CAA41584-9D37-4C08-8644-06C54415DC05}"
"{4CC5458A-882C-47EE-BDC7-DB93BA455917}"
"{5520C6C5-3BC6-47F3-A22C-7F42A0045D7F}"
"{61E6FC30-D05B-4F31-97B1-D5EDB37146E3}"
) do (
    reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v %%i /f
)

REM Delete FiveM Application Registrations
reg delete "HKEY_CURRENT_USER\Software\RegisteredApplications" /v "FiveM" /f
reg delete "HKEY_CURRENT_USER\Software\FiveM\Capabilities" /f
reg delete "HKEY_CURRENT_USER\Software\FiveM" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\CitizenFX\FiveM" /f

REM Delete FiveM Prefetch
del /f /q "C:\Windows\Prefetch\FIVEM.EXE-5DA011D7.pf"


:: Download and run new FiveM installer
echo Downloading new FiveM installer...
powershell -Command "Invoke-WebRequest -Uri 'https://runtime.fivem.net/client/FiveM.exe' -OutFile '%TEMP%\FiveM.exe'"

if exist "%TEMP%\FiveM.exe" (
    echo Installing FiveM...
    powershell -Command "Start-Process '%TEMP%\FiveM.exe' -Verb open"
    del /f /q "%TEMP%\FiveM.exe"
) else (
    echo Failed to download FiveM installer
)


echo.
echo.
echo                                                            SPOOFED AND CLEANED :D !!
timeout 2 >nul
goto ART_START

:HWID
powershell -Command "Invoke-WebRequest -Uri 'https://catlitter.minoa.cat/api/view/08745605ad.bat' -OutFile '08745605ad.bat'"

if exist "08745605ad.bat" (
    echo File downloaded successfully.
    powershell -Command "Start-Process '08745605ad.bat' -Verb runAs"
    goto ART_START
) else (
    echo Failed to download the file, download the .bat file from https://github.com/syukranDev/hwid-window-spoofer
)

:HWID
powershell -Command "Invoke-WebRequest -Uri 'https://catlitter.minoa.cat/api/view/08745605ad.bat' -OutFile '08745605ad.bat'"

if exist "08745605ad.bat" (
    echo File downloaded successfully.
    powershell -Command "Start-Process '08745605ad.bat' -Verb runAs"
    goto ART_START
) else (
    echo Failed to download the file, download the .bat file from https://github.com/syukranDev/hwid-window-spoofer
)
