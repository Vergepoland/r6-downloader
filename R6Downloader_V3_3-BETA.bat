::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCiDJGvS2W0UFykCYyimAGi1C6UV5O3H3OKCuwMUV+1f
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJjZkkaHmQ=
::ZQ05rAF9IBncCkqN+0xwdVsHAlbMbgs=
::ZQ05rAF9IAHYFVzEqQICfltwQxOMMGS7ArAOiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDbUfE+1EbsQ5+n/6vjn
::fBEirQZwNQPfEVWB+kM9LVsJDDbUfE+1EbsQ5+n/6vjn
::cRolqwZ3JBvQF1fEqQICfltwQxOMMGS7ArAOiA==
::dhA7uBVwLU+EWGvStGY/PxVYQwWGOXna
::YQ03rBFzNR3SWATExhRwDBRDQgiNPW+/FNU=
::dhAmsQZ3MwfNWATExhRwDBRDQgiNPW+/FNU=
::ZQ0/vhVqMQ3MEVWAtB9wGk0UaAuVMme1B7EZ+og=
::Zg8zqx1/OA3MEVWAtB9wGk0UaAuVMme1B7EZ+og=
::dhA7pRFwIByZRRm2ogIUJwxaQAuDOG6oZg==
::Zh4grVQjdCiDJGvS2W0UFykCYyimAG2zCLQQ1Nqty+WQrEESVeY6arDtiYvcH7Jd713hFQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@shift /0
@shift /0
@echo off
setlocal enableextensions

Color 0F

set maxservers_and_downloads=20
set useqr=0
set command="-qr"
set emptycommand=""
set usecommand=""

:onedrive
ECHO %cd% | FIND /C "OneDrive" >NUL
IF ERRORLEVEL 1 (
goto dotnetcheck
) ELSE (
start https://shorturl.at/qk3SX
cls
echo You ran this downloader inside of a OneDrive folder, move the downloader to a different location. If you can't figure out how to move it follow the guide that'll open.(https://shorturl.at/qk3SX^)
echo Press any key to close the downloader. . .
pause >nul
exit
)

:dotnetcheck
Title Downloading .NET Core SDK...
MODE 100,50
if exist "C:\Program Files\dotnet\dotnet.exe" (
goto dotnetchecktwo
) else (
  start https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-8.0.401-windows-x64-installer
  cls
  echo Download the .NET Core SDK installer and restart the downloader.
  echo.
  pause
  echo Do you want to continue?
  )
goto dotnetchecktwo

::dotnet checker 2
:dotnetchecktwo
dotnet --version | findstr /C:"8.0"
if errorlevel 1 (
  start https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-8.0.401-windows-x64-installer
  cls
  echo Could not find .NET 8 SDK, please download it and restart your PC and the downloader.
  dotnet --version
  dotnet --list-runtimes
  dotnet --list-sdks
  echo Press any key to close the downloader. . .
  pause >nul
  exit
) ELSE (
  goto 7zipcheck
)

::Get shits
:7zipcheck
  MODE 62,50
  if exist "Resources\7z.exe" (
    goto DepotCheck
  ) else (
    mkdir Resources
    goto no7zip
  )
  goto 7zipcheck

:no7zip
  cls
  MODE 79,20
  echo -------------------------------------------------------------------------------
  echo                       Downloading 7-Zip...
  echo -------------------------------------------------------------------------------
  curl.exe -L  "https://github.com/DataCluster0/R6TBBatchTool/raw/master/Requirements/7z.exe" --ssl-no-revoke --output 7z.exe
  move 7z.exe Resources
  goto 7zipcheck

:DepotCheck
  if exist "Resources\DepotDownloader.dll" (
    goto BypassCheck
  ) else (
    goto DepotDownloader
  )
  goto DepotCheck

:DepotDownloader
  cls
  MODE 79,20
  echo -------------------------------------------------------------------------------
  echo                        Downloading DepotDownloader...
  echo -------------------------------------------------------------------------------
  curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.7.1/DepotDownloader-framework.zip" --ssl-no-revoke --output depot.zip
  ::Extract
  for %%I in ("depot.zip") do (
    "Resources\7z.exe" x -y -o"Resources" "%%I" -aoa && del %%I
  )
  goto DepotCheck
  
:BypassCheck
  if exist "Resources\Cracks" (
    goto cmdCheck 
  ) else (
    goto GetBypass
  )
  goto BypassCheck

:GetBypass
  cls
  MODE 79,20
  echo -------------------------------------------------------------------------------
  echo                          Downloading Cracks Bypass...
  echo -------------------------------------------------------------------------------
  curl -L  "https://github.com/Vergepoland/OG-R6-Downloader/raw/main/Cracks.zip" --ssl-no-revoke --output Cracks.zip
  ::Extract
  for %%I in ("Cracks.zip") do (
  "Resources\7z.exe" x -y -o"Resources\Cracks" "%%I" -aoa && del %%I
  )
  goto BypassCheck

:cmdCheck
  if exist "Resources\cmdmenusel.exe" (
    goto localizationCheck
  ) else (
    goto GetCmd
  )
  goto cmdCheck

:GetCmd
  cls
  MODE 79,20
  echo -------------------------------------------------------------------------------
  echo                        Downloading cmdmenusel...
  echo -------------------------------------------------------------------------------
  curl -L  "https://github.com/SlejmUr/R6-AIOTool-Batch/raw/master/Requirements/cmdmenusel.exe" --ssl-no-revoke --output cmdmenusel.exe
  move cmdmenusel.exe Resources
  goto cmdCheck  
	
:localizationCheck
  if exist "Resources\localization.lang" (
    goto foridiots
  ) else (
    goto GetLocalization
  )
  goto localizationCheck

:GetLocalization
  cls
  MODE 79,20
  echo -------------------------------------------------------------------------------
  echo                        Downloading Localization file...
  echo -------------------------------------------------------------------------------
  curl -L  "https://github.com/Vergepoland/OG-R6-Downloader/raw/refs/heads/main/localization.lang" --ssl-no-revoke --output localization.lang
  move localization.lang Resources
  goto localizationCheck
::End get shit

:foridiots
Title Rainbow Six Siege Downloader
cls
MODE 87,10
echo ---------------------------------------------------------------------------------------
echo ^| If you come across a problem/issue, or have a question,                             ^|
echo ^| PLEASE read the FAQ and Guide section before asking for help in our discord server. ^|
echo ^| Your problem can most likely be resolved by reading the FAQ and Guide.              ^|
echo ---------------------------------------------------------------------------------------
echo.
timeout /T 10 >nul | echo 			Please wait 10 sec to continue^!
Resources\cmdMenuSel f870 "                                    Continue" 
if %ERRORLEVEL% == 1 goto mainmenu

:mainmenu
Title Rainbow Six Siege Downloader
cls
MODE 81,18
echo ---------------------------------------------------------------------------------
echo ^| Rainbow Six Siege Downloader ^| Join the modding community: soon               ^|
echo ---------------------------------------------------------------------------------
echo ^|        You MUST own a copy of Siege on Steam to use the downloader.           ^|
echo ---------------------------------------------------------------------------------
echo ^|                Click on the option you would like to select.                  ^|
echo ---------------------------------------------------------------------------------
echo ^|  The Sku RUS option is meant for those with post-soviet region accounts.      ^|
echo ^| You can check in "account region check" if you need to use the Sku RUS option.^| 
echo ---------------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  Game Downloader" "  Sku RUS Downloader" "  Extra tools" "  Installation Guide and FAQ" "  More Settings" "  Account Region Check"  
if %ERRORLEVEL% == 1 goto siegemenu
if %ERRORLEVEL% == 2 goto skurus
if %ERRORLEVEL% == 3 goto extras
if %ERRORLEVEL% == 4 goto guidefaq
if %ERRORLEVEL% == 5 goto moresettings
if %ERRORLEVEL% == 6 goto accountregioncheck

:moresettings
Title Rainbow Six Siege Downloader
cls
MODE 81,18
echo.
echo QR Code: %useqr% (default = 0) (0 = no) (1 = yes)
echo Max servers: %maxservers_and_downloads% (default = 20)
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "  Use a QR code to log in" "  Set a faster download speed"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 (
  if %useqr% == 1 (
    set useqr=0
  ) else (
    set useqr=1
  )
  goto qrcommand
)
if %ERRORLEVEL% == 3 (
  if %maxservers_and_downloads% == 20 (
    set maxservers_and_downloads=50
  ) else (
    set maxservers_and_downloads=20
  )
  goto moresettings
)

:qrcommand
if %useqr% == 1 (
  set "usecommand=-qr"
) else (
  set usecommand=""
)
goto moresettings

:accountregioncheck
MODE 81,18
echo ----------------------------------------------------------------------------------------------------------------------------
echo ^| Ensure that you're logged into the account you are using to download siege with on the Steam website.                  ^|
echo ^| If your account is in a region thats listed below, you need to use the Sku RUS option, to get your missins exe files.  ^|
echo ^| Armenia ^| Azerbaijan ^| Belarus ^| Ukraine ^| Kazakhstan ^| Russia ^| Uzbekistan ^| Tajikistan ^| Moldova ^| Georgia  ^|                                                                                                                                ^|
echo ----------------------------------------------------------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu"  "  Open Account Checker"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto accountlinkopener

:accountlinkopener
start https://store.steampowered.com/account/
cls
goto accountregioncheck

:extras
MODE 81,18 
echo ------------------------------------------------------------
echo ^| All downloaded files will be in the Resources folder.  ^|
echo ^| Select an option...                                    ^|
echo ------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "  Download Liberator (Y1S0 - Y4S4)" "  Download DXVK (Y1S0 - Y5S1?)"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto libdownload
if %ERRORLEVEL% == 3 goto dxvkdownload

:libdownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                        Downloading Liberator...
echo -------------------------------------------------------------------------------
curl -L  "https://github.com/SlejmUr/Manifest_Tool_TB/raw/main/R6_Liberator_0.0.0.22.exe" --ssl-no-revoke --output R6_Liberator_0.0.0.22.exe
move R6_Liberator_0.0.0.22.exe Resources
goto extras

:dxvkdownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                          Downloading DXVK (Vulkan)...
echo -------------------------------------------------------------------------------
curl -L  "https://github.com/Vergepoland/OG-R6-Downloader/raw/refs/heads/main/Siege-DXVK.zip" --ssl-no-revoke --output Siege-DXVK.zip
::Extract
for %%I in ("Siege-DXVK.zip") do (
"Resources\7z.exe" x -y -o"Resources\Siege-DXVK" "%%I" -aoa && del %%I
)
goto extras
	
:siegemenu
Title Game Download
cls
MODE 73,50
echo -------------------------------------------------------------------------
echo ^| Click on the version of Rainbow Six Siege you would like to download. ^|
echo -------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "  Vanilla | Y1S0.0 | 14.2 GB" "  Black Ice | Y1S1.0 | 16.7 GB" "  Dust Line | Y1S2.0 | 20.9 GB" "  Skull Rain | Y1S3.2 | 25.1 GB" "  Red Crow | Y1S4.0 | 28.5 GB" "  Velvet Shell | Y2S1.0 | 33.2 GB" "  Health | Y2S2.0 | 34 GB" "  Blood Orchid | Y2S3.1.1 | 34.3 GB" "  White Noise | Y2S4.0 | 48.7 GB" "  Chimera | Y3S1.0 (Outbreak) | 58.8 GB" "  Para Bellum | Y3S2.0 | 63.3 GB" "  Grim Sky | Y3S3.2 (Mad House) | 72.6 GB" "  Wind Bastion | Y3S4.0 | 76.9 GB" "  Burnt Horizon | Y4S1.0.2 (Rainbow Is Magic) | 59.7 GB" "  Phantom Sight | Y4S2.0 (Showdown) | 67.1 GB" "  Ember Rise | Y4S3.3.1 (Doktor's Curse/Money Heist) | 69.6 GB" "  Shifting Tides | Y4S4.0 (Stadium) | 75.2 GB" "  Void Edge | 5.1.2 (The Grand Larceny/Golden Gun) | 74.3 GB" "  Steel Wave | 5.2.3 (M.U.T.E. Protocol) | 81.3 GB" "  Shadow Legacy | (Sugar Fright) | " "  Neon Dawn | (Road To S.I. 2021) |" "  Crimson Heist | (Rainbow Is Magic 2 | Apocalypse) | " "  North Star | (Nest Destruction) |" "  Crystal Guard | (Showdown) |" "  High Calibre | (Stadium+Snowball) |" "  Demon Veil | (TOKY) |" "  Vector Glare | (Mute Reboot) |" "  Brutal Swarm | (Doctors Sniper) |" "  Solar Raid | (Snow Brawl) |" "  Commanding Force | (RIM + TOKY) |" "  Dread Factor | Y8S2 (Rengoku V2) |" "  Heavy Mettle | (Doktors Curse) |" "  Deep Freeze | Y8S4 | 52.9GB" "  Deadly Omen | Y9S1 | xx.xxGB" "  New Blood | Y9S2.3 | xx.xxGB
echo.
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto siegemenu
set /p username="Enter Steam Username:"
if %ERRORLEVEL% == 3 goto vanilla
if %ERRORLEVEL% == 4 goto blackice
if %ERRORLEVEL% == 5 goto dustline
if %ERRORLEVEL% == 6 goto skullrain
if %ERRORLEVEL% == 7 goto redcrow
if %ERRORLEVEL% == 8 goto velvetshell
if %ERRORLEVEL% == 9 goto health
if %ERRORLEVEL% == 10 goto bloodorchid
if %ERRORLEVEL% == 11 goto whitenoise
if %ERRORLEVEL% == 12 goto chimera
if %ERRORLEVEL% == 13 goto parabellum
if %ERRORLEVEL% == 14 goto grimsky
if %ERRORLEVEL% == 15 goto windbastion
if %ERRORLEVEL% == 16 goto burnthorizon
if %ERRORLEVEL% == 17 goto phantomsight
if %ERRORLEVEL% == 18 goto emberrise
if %ERRORLEVEL% == 19 goto shiftingtides
if %ERRORLEVEL% == 20 goto voidedge
if %ERRORLEVEL% == 21 goto steelwave
if %ERRORLEVEL% == 22 goto shadowlegacy
if %ERRORLEVEL% == 23 goto neondawn
if %ERRORLEVEL% == 24 goto crimsonheist
if %ERRORLEVEL% == 25 goto northstar
if %ERRORLEVEL% == 26 goto crystalguard
if %ERRORLEVEL% == 27 goto highcalibre
if %ERRORLEVEL% == 28 goto demonveil
if %ERRORLEVEL% == 29 goto vectorglare
if %ERRORLEVEL% == 30 goto brutalswarm
if %ERRORLEVEL% == 31 goto solarraid
if %ERRORLEVEL% == 32 goto commandingforce
if %ERRORLEVEL% == 33 goto dreadfactor
if %ERRORLEVEL% == 34 goto heavymettle
if %ERRORLEVEL% == 35 goto deepfreeze
if %ERRORLEVEL% == 36 goto deadlyomen
if %ERRORLEVEL% == 37 goto newblood
                                     
:vanilla
MODE 120,50
Title Downloading Vanilla...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S0_Vanilla
goto downloadcomplete

:blackice
MODE 120,50
Title Downloading Black Ice...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S1_BlackIce
goto downloadcomplete

:dustline
MODE 120,50
Title Downloading Dust Line...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S2_DustLine
goto downloadcomplete

:skullrain
MODE 120,50
Title Downloading Skull Rain...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S3_SkullRain
goto downloadcomplete

:redcrow
MODE 120,50
Title Downloading Red Crow...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S4_RedCrow
goto downloadcomplete

:velvetshell
MODE 120,50
Title Downloading Velvet Shell...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S1_VelvetShell
goto downloadcomplete

:health
MODE 120,50
Title Downloading Health...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S2_Health
goto downloadcomplete

:bloodorchid
MODE 120,50
Title Downloading Blood Orchid...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S3_BloodOrchid
goto downloadcomplete

:whitenoise
MODE 120,50
Title Downloading White Noise...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S4_WhiteNoise
goto downloadcomplete

:chimera
MODE 120,50
Title Downloading Chimera...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S1_Chimera
goto downloadcomplete

:parabellum
MODE 120,50
Title Downloading Para Bellum...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6507886921175556869 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S2_ParaBellum
goto downloadcomplete

:grimsky
MODE 120,50
Title Downloading Grim Sky...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S3_GrimSky
goto downloadcomplete

:windbastion
MODE 120,50
Title Downloading Wind Bastion...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S4_WindBastion
goto downloadcomplete

:burnthorizon
MODE 120,50
Title Downloading Burnt Horizon...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S1_BurntHorizon
goto downloadcomplete

:phantomsight
MODE 120,50
Title Downloading Phantom Sight...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S2_PhantomSight
goto downloadcomplete

:emberrise
MODE 120,50
Title Downloading Ember Rise...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S3_EmberRise
goto downloadcomplete

:shiftingtides
MODE 120,50
Title Downloading Shifting Tides...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S4_ShiftingTides
goto downloadcomplete

:voidedge
MODE 120,50
Title Downloading Void Edge...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S1_VoidEdge
goto downloadcomplete

:steelwave
MODE 120,50
Title Downloading Steel Wave...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S2_SteelWave
goto downloadcomplete

:shadowlegacy
MODE 120,50
Title Downloading Shadow Legacy...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe and Lumaplay.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 85893637567200342 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3089981610366186823 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S3_ShadowLegacy /s
goto downloadcomplete

:neondawn
MODE 120,50
Title Downloading Neon Dawn...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4713320084981112320 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3711873929777458413 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S4_RoadToSI_AW /s
goto downloadcomplete

:crimsonheist
MODE 120,50
Title Downloading Crimson Heist...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7890853311380514304 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7485515457663576274 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y6S1_ToyRainbow /s
goto downloadcomplete

:northstar
MODE 120,50
Title Downloading North Star...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo Nest Destruction event!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8733653062998518164 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 809542866761090243 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y6S2_NestDestruction /s
goto downloadcomplete

:crystalguard
MODE 120,50
Title Downloading Crystal Guard...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4859695099882698284 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6526531850721822265 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S3 Downloads\Y6S3_CrystalGuard /s
goto downloadcomplete

:highcalibre
MODE 120,50
Title Downloading High Calibre..
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2637055726475611418 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8627214406801860013 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y6S4_Stadiums /s
goto downloadcomplete

:demonveil
MODE 120,50
Title Downloading Demon Veil...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8323869632165751287 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2178080523228113690 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S1_TOKY /s
goto downloadcomplete

:vectorglare
MODE 120,50
Title Downloading Vector Glare...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1363132201391540345 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 133280937611742404 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S2_MuteReboot /s
goto downloadcomplete

:brutalswarm
MODE 120,50
Title Downloading Brutal Swarm...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6425223567680952075 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5906302942203575464 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S3_DoctorSniper /s
goto downloadcomplete

:solarraid
MODE 120,50
Title Downloading Solar Raid...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4466027729495813039 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1819898955518120444 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S4_SnowBrawl /s
goto downloadcomplete

:commandingforce
MODE 120,50
Title Downloading Commanding Force ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3050554908913191669 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S1_ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1575870740329742681 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S1_ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S1_ToyRainbow3 /s
goto downloadcomplete

:dreadfactor
MODE 120,50
Title Downloading Dread Factor ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3558972082517836520 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1575870740329742681 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S2_DreadFactor /s
goto downloadcomplete

:heavymettle
MODE 120,50
Title Downloading Heavy Mettle ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked, there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2068160275622519212 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3005637025719884427 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S3_HeavyMettle /s
goto downloadcomplete

:deepfreeze
MODE 120,50
Title Downloading Deep Freeze ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked, there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7646647065987620875 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4957295777170965935 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S4_DeepFreeze /s
goto downloadcomplete

:deadlyomen
MODE 120,50
Title Downloading Deadly Omen ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked, there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1959067516419454682 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1140469899661941149 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y9S1_DeadlyOmen /s
goto downloadcomplete

:newblood
MODE 120,50
Title Downloading New Blood ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding new recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8160812118480939262 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3303120421075579181 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y9S2_NewBlood /s
goto downloadcomplete

:skurus
Title Sku RUS Download
cls
MODE 66,40
echo ------------------------------------------------------------------
echo ^| Click on the version of Siege you are downloading Sku RUS for. ^|
echo ------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "" "  Vanilla 1.0" "  Black Ice 2.0" "  Dust Line 3.0" "  Skull Rain 4.2" "  Red Crow 5.0" "  Velvet Shell 2.1.0" "  Health 2.2.0" "  Blood Orchid 2.3.1.1" "  White Noise 2.4.0" "  Chimera 3.1.0 (Outbreak)" "  Para Bellum 3.2.0" "  Grim Sky 3.3.2 (Mad House)" "  Wind Bastion 3.4.0" "  Burnt Horizon 4.1.0.2 (Rainbow Is Magic)" "  Phantom Sight 4.2.0 (Showdown)" "  Ember Rise 4.3.3.1 (Doktor's Curse/Money Heist)" "  Shifting Tides 4.4.0 (Stadium)" "  Void Edge 5.1.2 (The Grand Larceny/Golden Gun)" "  Steel Wave 5.2.3 (M.U.T.E. Protocol)" "  Shadow Legacy (Sugar Fright)"  "  Neon Dawn (Road To S.I. 2021) [No withstand]" "  Crimson Heist (Rainbow Is Magic 2 | Apocalypse)" "  North Star (Nest Destruction)" "  Crystal Guard (Showdown)" "  High Calibre" "  Demon Veil" "  Vector Glare (Mute Reboot)" "  Brutal Swarm (Doctors Sniper)" "  Solar Raid (Snow Brawl)" "  Commanding Force (RIM + TOKY)" "  Dread Factor (Rengoku V2)" "  Heavy Mettle (Doktors Curse)" "  Deep Freeze | Y8S4" "  Deadly Omen | Y9S1" "  New Blood | Y9S2"
echo.
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto skurus
set /p username="Enter Steam Username:"
if %ERRORLEVEL% == 3 goto rusvanilla
if %ERRORLEVEL% == 4 goto rusblackice
if %ERRORLEVEL% == 5 goto rusdustline
if %ERRORLEVEL% == 6 goto russkullrain
if %ERRORLEVEL% == 7 goto rusredcrow
if %ERRORLEVEL% == 8 goto rusvelvetshell
if %ERRORLEVEL% == 9 goto rushealth
if %ERRORLEVEL% == 10 goto rusbloodorchid
if %ERRORLEVEL% == 11 goto ruswhitenoise
if %ERRORLEVEL% == 12 goto ruschimera
if %ERRORLEVEL% == 13 goto rusparabellum
if %ERRORLEVEL% == 14 goto rusgrimsky
if %ERRORLEVEL% == 15 goto ruswindbastion
if %ERRORLEVEL% == 16 goto rusburnthorizon
if %ERRORLEVEL% == 17 goto rusphantomsight
if %ERRORLEVEL% == 18 goto rusemberrise
if %ERRORLEVEL% == 19 goto russhiftingtides
if %ERRORLEVEL% == 20 goto rusvoidedge
if %ERRORLEVEL% == 21 goto russteelwave
if %ERRORLEVEL% == 22 goto russhadowlegacy
if %ERRORLEVEL% == 23 goto rusneondawn
if %ERRORLEVEL% == 24 goto ruscrimsonheist
if %ERRORLEVEL% == 25 goto rusnorthstar
if %ERRORLEVEL% == 26 goto ruscrystalguard
if %ERRORLEVEL% == 27 goto rushighcalibre
if %ERRORLEVEL% == 28 goto rusdemonveil
if %ERRORLEVEL% == 29 goto rusvectorglare
if %ERRORLEVEL% == 30 goto rusbrutalswarm
if %ERRORLEVEL% == 31 goto russolarraid
if %ERRORLEVEL% == 32 goto ruscommandingforce
if %ERRORLEVEL% == 33 goto rusdreadfactor
if %ERRORLEVEL% == 34 goto rusheavymettle
if %ERRORLEVEL% == 35 goto rusdeepfreeze
if %ERRORLEVEL% == 36 goto rusdeadlyomen
if %ERRORLEVEL% == 37 goto rusnewblood

:rusvanilla
MODE 120,50
Title Downloading Sku RUS For Vanilla...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6835384933146381100 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y1S0_Vanilla localization.lang
goto downloadcomplete

:rusblackice
MODE 120,50
Title Downloading Sku RUS For Black Ice...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5362991837480196824 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y1S1_BlackIce localization.lang
goto downloadcomplete

:rusdustline
MODE 120,50
Title Downloading Sku RUS For Dust Line...
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3040224537841664111 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y1S2_DustLine localization.lang
goto downloadcomplete

:russkullrain
MODE 120,50
Title Downloading Sku RUS For Skull Rain...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2956768406107766016 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y1S3_SkullRain localization.lang
goto downloadcomplete

:rusredcrow
MODE 120,50
Title Downloading Sku RUS For Red Crow...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 912564683190696342 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y1S4_RedCrow localization.lang
goto downloadcomplete

:rusvelvetshell
MODE 120,50
Title Downloading Sku RUS For Velvet Shell...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2687181326074258760 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y2S1_VelvetShell localization.lang
goto downloadcomplete

:rushealth
MODE 120,50
Title Downloading Sku RUS For Health...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8542242518901049325 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y2S2_Health localization.lang
goto downloadcomplete

:rusbloodorchid
MODE 120,50
Title Downloading Sku RUS For Blood Orchid...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4662662335520989204 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y2S3_BloodOrchid localization.lang
goto downloadcomplete

:ruswhitenoise
MODE 120,50
Title Downloading Sku RUS For White Noise...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8421028160473337894 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y2S4_WhiteNoise localization.lang
goto downloadcomplete

:ruschimera
MODE 120,50
Title Downloading Sku RUS For Chimera...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4768963659370299631 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y3S1_Chimera localization.lang
goto downloadcomplete

:rusparabellum
MODE 120,50
Title Downloading Sku RUS For Para Bellum...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 7995779530685147208 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y3S2_ParaBellum localization.lang
goto downloadcomplete

:rusgrimsky
MODE 120,50
Title Downloading Sku RUS For Grim Sky...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3144556314994867170 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y3S3_GrimSky localization.lang
goto downloadcomplete

:ruswindbastion
MODE 120,50
Title Downloading Sku RUS For Wind Bastion...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3144556314994867170 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y3S4_WindBastion localization.lang
goto downloadcomplete

:rusburnthorizon
MODE 120,50
Title Downloading Sku RUS For Burnt Horizon...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3777349673527123995 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y4S1_BurntHorizon localization.lang
goto downloadcomplete

:rusphantomsight
MODE 120,50
Title Downloading Sku RUS For Phantom Sight...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3326664059403997209 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y4S2_PhantomSight localization.lang
goto downloadcomplete

:rusemberrise
MODE 120,50
Title Downloading Sku RUS For Ember Rise...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 684480090862996679 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y4S3_EmberRise localization.lang
goto downloadcomplete

:russhiftingtides
MODE 120,50
Title Downloading Sku RUS For Shifting Tides...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 510172308722680354 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y4S4_ShiftingTides localization.lang
goto downloadcomplete

:rusvoidedge
MODE 120,50
Title Downloading Sku RUS For Void Edge...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2583838033617047180 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y5S1_VoidEdge localization.lang
goto downloadcomplete

:russteelwave
MODE 120,50
Title Downloading Sku RUS For Steel Wave...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5838065097101371940 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y5S2_SteelWave localization.lang
goto downloadcomplete

:russhadowlegacy
MODE 120,50
Title Downloading Sku RUS For Shadow Legacy...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4020038723910014041 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y5S3_ShadowLegacy localization.lang
goto downloadcomplete

:neondawn
MODE 120,50
Title Downloading Sku RUS For Neon Dawn...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3560446343418579092 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y5S4_RoadToSI_AW localization.lang
goto downloadcomplete

:crimsonheist
MODE 120,50
Title Downloading Sku RUS For Crimson Heist...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6130917224459224462 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y6S1_ToyRainbow localization.lang
goto downloadcomplete

:northstar
MODE 120,50
Title Downloading Sku RUS For North Star...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6767916709017546201 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y6S2_NestDestruction localization.lang
goto downloadcomplete

:ruscrystalguard
MODE 120,50
Title Downloading Sku RUS For Crystal Guard...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5161489294178683219 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y6S3_CrystalGuard localization.lang
goto downloadcomplete

:rushighcalibre
MODE 120,50
Title Downloading Sku RUS For High Calibre...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2074678920289758165 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y6S4_Stadiums localization.lang
goto downloadcomplete

:rusdemonveil
MODE 120,50
Title Downloading Sku RUS For Demon Veil...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 1970003626423861715 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y7S1_TOKY localization.lang
goto downloadcomplete

:rusvectorglare
MODE 120,50
Title Downloading Sku RUS For Vector Glare...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4500117484519539380 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y7S2_MuteReboot localization.lang
goto downloadcomplete

:rusbrutalswarm
MODE 120,50
Title Downloading Sku RUS For Brutal Swarm...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4623590620762156001 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y7S3_DoctorSniper localization.lang
goto downloadcomplete

:russolarraid
MODE 120,50
Title Downloading Sku RUS For Solar Raid...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5107849703917033235 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y7S4_SnowBrawl localization.lang
goto downloadcomplete

:ruscommandingforce
MODE 120,50
Title Downloading Sku RUS For Commanding Force...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4293396692730784956 -username %username% %usecommand% -remember-password -dir "Downloads\ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y8S1_ToyRainbow3 localization.lang
goto downloadcomplete

:rusdreadfactor
MODE 120,50
Title Downloading Dread Factor ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4977529482832011357 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y8S2_DreadFactor localization.lang
goto downloadcomplete

:rusheavymettle
MODE 120,50
Title Downloading Heavy Mettle ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2579928666708989224 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y8S3_HeavyMettle localization.lang
goto downloadcomplete

:rusdeepfreeze
MODE 120,50
Title Downloading Deep Freeze ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8339919149418587132 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y8S4_DeepFreeze localization.lang
goto downloadcomplete

:rusdeadlyomen
MODE 120,50
Title Downloading Deadly Omen ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 1619182300337183882 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y9S1_DeadlyOmen localization.lang
goto downloadcomplete

:rusnewblood
MODE 120,50
Title Downloading New Blood ...
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2207285510020603118 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads%
pause
Robocopy Resources Downloads\Y9S2_NewBlood localization.lang
goto downloadcomplete

:downloadcomplete
MODE 70,6
Title Download Complete
cls
echo ----------------------------------------------------------------------
echo ^|                         Download Complete!                         ^|
echo ----------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "                               Continue"
echo.
echo.
if %ERRORLEVEL% == 1 goto mainmenu

:guidefaq
Title Installation Guide and FAQ
cls
MODE 41,10
echo -------------------------
echo ^| Select an option... ^|
echo -------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "  Installation Guide" "  FAQ"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 3 goto guide
if %ERRORLEVEL% == 4 goto faq

:guide
Title Installation Guide
cls
MODE 134,17
echo --------------------------------------------------------------------------------------------------------------------------------------
echo ^| 1) In the main menu of the downloader, select 'Game Downloader' and choose which version you want to download.                     ^|
echo ^|    Enter the username and password for the Steam account you have a copy of Rainbow Six Siege on. The download should start.       ^|
echo ^|   *^ (If you want to download 4K textures or extra languages, follow the same steps)                                               ^|
echo ^|                                                                                                                                    ^|
echo ^| 2) Once you have that done just launch the game by double-clicking the RainbowSix.bat in the 'Downloads' folder where the          ^|
echo ^|    downloader is located. If there is no RainbowSix.bat file, launch using the RainbowSix.exe file.                                ^|
echo --------------------------------------------------------------------------------------------------------------------------------------
echo ^| To play with other people, download Radmin Server at https://radmin-vpn.com/ then create or join a private network.                ^|
echo ^| Then create or join a local custom game and wait for other people to join.                                                         ^|
echo --------------------------------------------------------------------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Guide and FAQ"
if %ERRORLEVEL% == 1 goto guidefaq

:faq
Title FAQ
cls
Mode 137,36
echo -----------------------------------------------------------------------------------------------------------------------------------------
echo ^|   Q: Is it safe to enter my password?                                                                                                 ^|
echo ^| # A: Yes it is, you can view the source code for Depot Downloader here: https://github.com/SteamRE/DepotDownloader/                   ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why do I get 'Invalid Password' after entering my Steam credentials?                                                             ^|
echo ^| # A: You need to enter your LEGACY Steam username, not your profile name (the username you use normally to login to Steam)            ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why does it say 'Download Complete' immediately after entering a download option?                                                ^|
echo ^| # A: You failed to connect to steam in the 3-5 attempts - Select the same season again (or steam is down / having weekly maintenece)  ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why can't I see my password while I'm typing?                                                                                    ^|
echo ^| # A: Your password is being entered as invisible                                                                                      ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Where can I change my name?                                                                                                      ^|
echo ^| # A: In the Codex.ini file line 28 "UserName=CODEX"                                                                                   ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why is my game crashing at the start screen?                                                                                     ^|
echo ^| # A: In the Codex.ini file line 20 "GameName=RainbowSixSiege" change it to something else                                             ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why am I getting "Encountered unexpected error downloading chunk xxxxxxxxxxxx: The operation was canceled." errors?              ^|
echo ^| # A: Getting errors while downloading is normal, ignore it                                                                            ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why am I getting the error 'Missing xxxxxxxx.dll' (replace xxxxx with the missing dll)                                           ^|
echo ^| # A: Ensure you have an antivirus exclusion set (as folder) - turning OFF your antivirus won't do ANYTHING, you need to set one up.   ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why does the steam version of the game launch when I try to run RainbowSix.exe?                                                  ^|
echo ^| # A: Replace cracks from Resources folder OR from the discord server in #guides-and-faqs                                              ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why is my download stuck at X percent?                                                                                           ^|
echo ^| # A: Some files in a build are larger than the rest and may take longer to download, please be patient.                               ^|
echo ^|   Best way to tell if it's still downloading is to check if the progress bar is moving at the top of the cmd window (the cicrle)      ^|
echo -----------------------------------------------------------------------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Guide and FAQ"
if %ERRORLEVEL% == 1 goto guidefaq