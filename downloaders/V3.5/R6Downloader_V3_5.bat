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

:warning
Title Rainbow Six Siege Downloader
cls
MODE 87,10
echo --------------------------------------------------------------------------------
echo ^| PLEASE ENSURE YOU HAVE AN ANTIVIRUS EXCLUSION SET UP BEFORE CONTINUING!!    ^|
echo ^| THE DOWNLOADER AND GAME WILL HAVE TROUBLE FUNCTIONING WITH NO EXCLUSION!!   ^|
echo ^| TURNING OFF YOUR ANTIVIRUS ISNT THE SAME - YOU NEED TO SET ONE UP           ^|
echo --------------------------------------------------------------------------------
echo.
timeout /T 10 >nul | echo 			 Wait 10 sec to continue^!
Resources\cmdMenuSel f870 "                                    Continue" ""
if %ERRORLEVEL% == 1 goto onedrive

:onedrive
ECHO %cd% | FIND /C "OneDrive" >NUL
IF ERRORLEVEL 1 (
goto dotnetcheck
) ELSE (
start https://shorturl.at/qk3SX
cls
echo ----------------------------------------------------------------------------------------------------------------
echo ^| You ran this downloader inside of a OneDrive folder, move the downloader to a different location.            ^|
echo ^| If you can't figure out how to move it follow this guide: https://shorturl.at/qk3SX                          ^|
echo ^| PLEASE just check ALL of the Onedrive folder locations ^| DONT MAKE HELP POSTS ABOUT THIS - USE YOUR BRAIN   ^|
echo -----------------------------------------------------------------------------------------------------------------
echo Press any key to close the downloader. . .
pause >nul
exit
)

:dotnetcheck
Title Downloading .NET 9 SDK...
MODE 100,50
if exist "C:\Program Files\dotnet\dotnet.exe" (
goto dotnetchecktwo
) else (
  start https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-9.0.102-windows-x64-installer
  cls
  echo Download the .NET SDK installer and restart the downloader.
  echo.
  pause
  echo Do you want to continue?
  )
goto dotnetchecktwo

::dotnet checker 2
:dotnetchecktwo
dotnet --version | findstr /C:"9.0"
if errorlevel 1 (
  https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-9.0.102-windows-x64-installer
  cls
  echo Could not find .NET 9 SDK, please download it and restart the downloader. 
  dotnet --version
  dotnet --list-runtimes
  dotnet --list-sdks
  echo Press any key to close the downloader. . .
  pause >nul
  exit
) ELSE (
  goto 7ZipCheck
)

::Get resources
:7ZipCheck
    MODE 62,50
    if exist "Resources\7z.exe" (
      goto DepotCheck
    ) else (
      mkdir Resources
      goto get7Zip
    )
    goto 7ZipCheck

:get7Zip
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
    curl -L  "https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_3.0.0/DepotDownloader-framework.zip" --ssl-no-revoke --output depot.zip
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
	curl -L  "https://github.com/Vergepoland/r6-downloader/raw/refs/heads/main/Cracks.zip" --ssl-no-revoke --output Cracks.zip
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
	curl -L  "https://github.com/Vergepoland/r6-downloader/raw/refs/heads/main/localization.lang" --ssl-no-revoke --output localization.lang
	move localization.lang Resources
	goto localizationCheck

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
Resources\cmdMenuSel f870 "                                    Continue" ""
if %ERRORLEVEL% == 1 goto mainmenu

:mainmenu
Title Rainbow Six Siege Downloader
cls
MODE 81,18
echo ---------------------------------------------------------------------------------
echo ^|                     OG Rainbow Six Siege Downloader (V3.5)                    ^|
echo ---------------------------------------------------------------------------------
echo ^|            YOU MUST OWN A COPY OF SIEGE ON STEAM TO USE THE DOWNLOADER!!      ^|
echo ---------------------------------------------------------------------------------
echo ^|                           Select an option below.                             ^|
echo --------------------------------------------------------------------------------- 
echo.
Resources\cmdMenuSel f870 "  Game Downloader" "  Installation Guide and FAQ" "  Downloader Settings" "  Extra Tools Download Menu"
if %ERRORLEVEL% == 1 goto downloadmenu
if %ERRORLEVEL% == 2 goto guidefaq
if %ERRORLEVEL% == 3 goto moresettings
if %ERRORLEVEL% == 4 goto extratools

:downloadmenu
Title Game Downloader
cls
MODE 73,50
echo -------------------------------------------------------------------------
echo ^| Click on the version of Rainbow Six Siege you would like to download. ^|
echo -------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "" "  Vanilla Y1S0 | 14.2 GB" "  Black Ice Y1S1 | 16.7 GB" "  Dust Line Y1S2 | 20.9 GB" "  Skull Rain Y1S3 | 25.1 GB" "  Red Crow Y1S4 | 28.5 GB" "  Velvet Shell Y2S1 | 33.2 GB" "  Health Y2S2 | 34 GB" "  Blood Orchid Y2S3 | 34.3 GB" "  White Noise Y2S4 | 48.7 GB" "  Chimera Y3S1 (Outbreak) | 58.8 GB" "  Para Bellum Y3S2 | 63.3 GB" "  Grim Sky Y3S3 (Mad House) | 72.6 GB" "  Wind Bastion Y3S4 | 76.9 GB" "  Burnt Horizon Y4S1 (Rainbow Is Magic) | 59.7 GB" "  Phantom Sight Y4S2 (Showdown) | 67.1 GB" "  Ember Rise Y4S3 (Doktor's Curse/Money Heist) | 69.6 GB" "  Shifting Tides Y4S4 (Stadium) | 75.2 GB" "  Void Edge Y5S1 (The Grand Larceny/Golden Gun) | 74.3 GB" "  Steel Wave Y5S2 (M.U.T.E. Protocol) | 81.3 GB" "  Shadow Legacy Y5S3 (Sugar Fright) | 88GB" "  Neon Dawn Y5S4 (Road To S.I. 2021) |" "  Crimson Heist Y6S1 (Rainbow Is Magic 2 | Apocalypse) | " "  North Star Y6S2 (Nest Destruction) |" "  Crystal Guard Y6S3 (Showdown) |" "  High Calibre Y6S4 (Stadium+Snowball) |" "  Demon Veil Y7S1 (TOKY) |" "  Vector Glare Y7S2 (Mute Reboot) |" "  Brutal Swarm Y7S3 (Doctors Sniper) |" "  Solar Raid Y7S4 (Snow Brawl) |" "  Commanding Force Y8S1 (RIM + TOKY) |" "  Dread Factor Y8S2 (Rengoku V2) |" "  Heavy Mettle Y8S3 (Doktor's Curse) | NO OPERATORS" "  Deep Freeze Y8S4 | 52.9GB | NO OPERATORS" "  Deadly Omen Y9S1 | NO OPERATORS" "  New Blood Y9S2 | NO OPERATORS" "  Twin Shells Y9S3 | 59.2GB | NO OPERATORS"
echo.
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto downloadmenu
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
if %ERRORLEVEL% == 38 goto twinshells
                                     
:vanilla
MODE 120,50
Title Downloading Vanilla...
cls
set /p username="Enter Steam Username:"
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8358812283631269928 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6835384933146381100 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3893422760579204530 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S0_Vanilla" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S0_Vanilla
Robocopy Resources Downloads\Y1S0_Vanilla localization.lang /IS /IT
goto downloadcomplete

:blackice
MODE 120,50
Title Downloading Black Ice...
cls
set /p username="Enter Steam Username:"
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5188997148801516344 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5362991837480196824 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7932785808040895147 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S1_BlackIce" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S1_BlackIce
Robocopy Resources Downloads\Y1S1_BlackIce localization.lang /IS /IT
goto downloadcomplete

:dustline
MODE 120,50
Title Downloading Dust Line...
cls
set /p username="Enter Steam Username:"
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2303064029242396590 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3040224537841664111 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2206497318678061176 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S2_DustLine" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S2_DustLine
Robocopy Resources Downloads\Y1S2_DustLine localization.lang /IS /IT
goto downloadcomplete

:skullrain
MODE 120,50
Title Downloading Skull Rain...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5819137024728546741 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2956768406107766016 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5851804596427790505 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S3_SkullRain" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S3_SkullRain
Robocopy Resources Downloads\Y1S3_SkullRain localization.lang /IS /IT
goto downloadcomplete

:redcrow
MODE 120,50
Title Downloading Red Crow...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3576607363557872807 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 912564683190696342 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8569920171217002292 -username %username% %usecommand% -remember-password -dir "Downloads\Y1S4_RedCrow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y1S4_RedCrow
Robocopy Resources Downloads\Y1S4_RedCrow localization.lang /IS /IT
goto downloadcomplete

:velvetshell
MODE 120,50
Title Downloading Velvet Shell...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2248734317261478192 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2687181326074258760 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8006071763917433748 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S1_VelvetShell" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S1_VelvetShell
Robocopy Resources Downloads\Y2S1_VelvetShell localization.lang /IS /IT
goto downloadcomplete

:health
MODE 120,50
Title Downloading Health...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5875987479498297665 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8542242518901049325 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 708773000306432190 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S2_Health" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S2_Health
Robocopy Resources Downloads\Y2S2_Health localization.lang /IS /IT
goto downloadcomplete

:bloodorchid
MODE 120,50
Title Downloading Blood Orchid...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6708129824495912434 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4662662335520989204 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1613631671988840841 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S3_BloodOrchid" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S3_BloodOrchid
Robocopy Resources Downloads\Y2S3_BloodOrchid localization.lang /IS /IT
goto downloadcomplete

:whitenoise
MODE 120,50
Title Downloading White Noise...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8748734086032257441 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8421028160473337894 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4221297486420648079 -username %username% %usecommand% -remember-password -dir "Downloads\Y2S4_WhiteNoise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y2S4_WhiteNoise
Robocopy Resources Downloads\Y2S4_WhiteNoise localization.lang /IS /IT
goto downloadcomplete

:chimera
MODE 120,50
Title Downloading Chimera...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5071357104726974256 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4768963659370299631 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4701787239566783972 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S1_Chimera" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S1_Chimera
Robocopy Resources Downloads\Y3S1_Chimera localization.lang /IS /IT
goto downloadcomplete

:parabellum
MODE 120,50
Title Downloading Para Bellum...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6507886921175556869 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 7995779530685147208 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8765715607275074515 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S2_ParaBellum" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S2_ParaBellum
Robocopy Resources Downloads\Y3S2_ParaBellum localization.lang /IS /IT
goto downloadcomplete

:grimsky
MODE 120,50
Title Downloading Grim Sky...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 5562094852451837435 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3144556314994867170 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7781202564071310413 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S3_GrimSky" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S3_GrimSky
Robocopy Resources Downloads\Y3S3_GrimSky localization.lang /IS /IT
goto downloadcomplete

:windbastion
MODE 120,50
Title Downloading Wind Bastion...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6502258854032233436 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3144556314994867170 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7659555540733025386 -username %username% %usecommand% -remember-password -dir "Downloads\Y3S4_WindBastion" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y3S4_WindBastion
Robocopy Resources Downloads\Y3S4_WindBastion localization.lang /IS /IT
goto downloadcomplete

:burnthorizon
MODE 120,50
Title Downloading Burnt Horizon...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8356277316976403078 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3777349673527123995 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5935578581006804383 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S1_BurntHorizon" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S1_BurntHorizon
Robocopy Resources Downloads\Y4S1_BurntHorizon localization.lang /IS /IT
goto downloadcomplete

:phantomsight
MODE 120,50
Title Downloading Phantom Sight...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 693082837425613508 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3326664059403997209 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5408324128694463720 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S2_PhantomSight" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S2_PhantomSight
Robocopy Resources Downloads\Y4S2_PhantomSight localization.lang /IS /IT
goto downloadcomplete

:emberrise
MODE 120,50
Title Downloading Ember Rise...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3546781236735558235 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 684480090862996679 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7869081741739849703 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S3_EmberRise" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S3_EmberRise
Robocopy Resources Downloads\Y4S3_EmberRise localization.lang /IS /IT
goto downloadcomplete

:shiftingtides
MODE 120,50
Title Downloading Shifting Tides...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 299124516841461614 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 510172308722680354 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1842268638395240106 -username %username% %usecommand% -remember-password -dir "Downloads\Y4S4_ShiftingTides" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y4S4_ShiftingTides
Robocopy Resources Downloads\Y4S4_ShiftingTides localization.lang /IS /IT
goto downloadcomplete

:voidedge
MODE 120,50
Title Downloading Void Edge...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4736360397583523381 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2583838033617047180 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6296533808765702678 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S1_VoidEdge" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S1_VoidEdge
Robocopy Resources Downloads\Y5S1_VoidEdge localization.lang /IS /IT
goto downloadcomplete

:steelwave
MODE 120,50
Title Downloading Steel Wave...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4367817844736324940 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5838065097101371940 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 893971391196952070 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S2_SteelWave" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S2_SteelWave
Robocopy Resources Downloads\Y5S2_SteelWave localization.lang /IS /IT
goto downloadcomplete

:shadowlegacy
MODE 120,50
Title Downloading Shadow Legacy...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe and Lumaplay.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 85893637567200342 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4020038723910014041 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3089981610366186823 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S3_ShadowLegacy" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S3_ShadowLegacy /s
Robocopy Resources Downloads\Y5S3_ShadowLegacy localization.lang /IS /IT
goto downloadcomplete

:neondawn
MODE 120,50
Title Downloading Neon Dawn...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4713320084981112320 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3560446343418579092 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3711873929777458413 -username %username% %usecommand% -remember-password -dir "Downloads\Y5S4_RoadToSI_AW" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y5S4_RoadToSI_AW /s
Robocopy Resources Downloads\Y5S4_RoadToSI_AW localization.lang /IS /IT
goto downloadcomplete

:crimsonheist
MODE 120,50
Title Downloading Crimson Heist...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7890853311380514304 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6130917224459224462 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 7485515457663576274 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S1_ToyRainbow" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y6S1_ToyRainbow /s
Robocopy Resources Downloads\Y6S1_ToyRainbow localization.lang /IS /IT
goto downloadcomplete

:northstar
MODE 120,50
Title Downloading North Star...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8733653062998518164 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 6767916709017546201 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 809542866761090243 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S2_NestDestruction" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y1SX-Y6S2 Downloads\Y6S2_NestDestruction /s
Robocopy Resources Downloads\Y6S2_NestDestruction localization.lang /IS /IT
goto downloadcomplete

:crystalguard
MODE 120,50
Title Downloading Crystal Guard...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4859695099882698284 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5161489294178683219 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 6526531850721822265 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S3_CrystalGuard" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S3 Downloads\Y6S3_CrystalGuard /s
Robocopy Resources Downloads\Y6S3_CrystalGuard localization.lang /IS /IT
goto downloadcomplete

:highcalibre
MODE 120,50
Title Downloading High Calibre..
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2637055726475611418 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2074678920289758165 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 8627214406801860013 -username %username% %usecommand% -remember-password -dir "Downloads\Y6S4_Stadiums" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y6S4_Stadiums /s
Robocopy Resources Downloads\Y6S4_Stadiums localization.lang /IS /IT
goto downloadcomplete

:demonveil
MODE 120,50
Title Downloading Demon Veil...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8323869632165751287 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 1970003626423861715 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 2178080523228113690 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S1_TOKY" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S1_TOKY /s
Robocopy Resources Downloads\Y7S1_TOKY localization.lang /IS /IT
goto downloadcomplete

:vectorglare
MODE 120,50
Title Downloading Vector Glare...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1363132201391540345 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4500117484519539380 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 133280937611742404 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S2_MuteReboot" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S2_MuteReboot /s
Robocopy Resources Downloads\Y7S2_MuteReboot localization.lang /IS /IT
goto downloadcomplete

:brutalswarm
MODE 120,50
Title Downloading Brutal Swarm...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 6425223567680952075 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4623590620762156001 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 5906302942203575464 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S3_DoctorSniper" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S3_DoctorSniper /s
Robocopy Resources Downloads\Y7S3_DoctorSniper localization.lang /IS /IT
goto downloadcomplete

:solarraid
MODE 120,50
Title Downloading Solar Raid...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4466027729495813039 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 5107849703917033235 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1819898955518120444 -username %username% %usecommand% -remember-password -dir "Downloads\Y7S4_SnowBrawl" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y7S4_SnowBrawl /s
Robocopy Resources Downloads\Y7S4_SnowBrawl localization.lang /IS /IT
goto downloadcomplete

:commandingforce
MODE 120,50
Title Downloading Commanding Force...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3050554908913191669 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S1_ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4293396692730784956 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S1_ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1575870740329742681 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S1_ToyRainbow3" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S1_ToyRainbow3 /s
Robocopy Resources Downloads\Y8S1_ToyRainbow3 localization.lang /IS /IT
goto downloadcomplete

:dreadfactor
MODE 120,50
Title Downloading Dread Factor...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 3558972082517836520 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 4977529482832011357 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1575870740329742681 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S2_DreadFactor" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S2_DreadFactor /s
Robocopy Resources Downloads\Y8S2_DreadFactor localization.lang /IS /IT
goto downloadcomplete

:heavymettle
MODE 120,50
Title Downloading Heavy Mettle...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 2068160275622519212 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2579928666708989224 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3005637025719884427 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S3_HeavyMettle" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S3_HeavyMettle /s
Robocopy Resources Downloads\Y8S3_HeavyMettle localization.lang /IS /IT
goto downloadcomplete

:deepfreeze
MODE 120,50
Title Downloading Deep Freeze...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 7646647065987620875 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 8339919149418587132 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 4957295777170965935 -username %username% %usecommand% -remember-password -dir "Downloads\Y8S4_DeepFreeze" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y8S4_DeepFreeze /s
Robocopy Resources Downloads\Y8S4_DeepFreeze localization.lang /IS /IT
goto downloadcomplete

:deadlyomen
MODE 120,50
Title Downloading Deadly Omen...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 1959067516419454682 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 1619182300337183882 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 1140469899661941149 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S1_DeadlyOmen" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y9S1_DeadlyOmen /s
Robocopy Resources Downloads\Y9S1_DeadlyOmen localization.lang /IS /IT
goto downloadcomplete

:newblood
MODE 120,50
Title Downloading New Blood...
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 8160812118480939262 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 2207285510020603118 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 3303120421075579181 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S2_NewBlood" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y9S2_NewBlood /s
Robocopy Resources Downloads\Y9S2_NewBlood localization.lang /IS /IT
goto downloadcomplete
:: 25/06/24 MANIFEST

:twinshells
Title Downloading New Blood... 
cls
set /p username="Enter Steam Username:"
echo Launch the game using the RainbowSix.bat file instead of the RainbowSix.exe^!
echo There are NO operators unlocked (excluding recruits), there is nothing you can do about it. 
pause
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377237 -manifest 4296569502001540403 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S3_TwinShells" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 377238 -manifest 3038245830342960035 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S3_TwinShells" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
dotnet Resources\DepotDownloader.dll -app 359550 -depot 359551 -manifest 825321500774263546 -username %username% %usecommand% -remember-password -dir "Downloads\Y9S3_TwinShells" -validate -max-servers %maxservers_and_downloads% -max-downloads %maxservers_and_downloads% -V
pause 
Robocopy Resources\Cracks\Y6S4-Y8SX Downloads\Y9S3_TwinShells /s
Robocopy Resources Downloads\Y9S3_TwinShells localization.lang /IS /IT
goto downloadcomplete
:: 07/11/24 MANIFEST

:downloadcomplete
MODE 70,6
Title Download Complete
cls
echo -------------------------
echo ^|   Download Complete!   ^|
echo -------------------------
echo.
Resources\cmdMenuSel f870 "         Continue"
echo.
if %ERRORLEVEL% == 1 goto mainmenu

:extratools
Title Extra Tools Download for OG Siege
cls
MODE 81,18 
echo ----------------------------------------------------------
echo ^| All downloaded files will be in the Resources folder.  ^|
echo ^|                Select an option.                       ^|
echo ----------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "" "  Download Liberator (Y1S0 - Y4S4)" "  Download Liberator 2 (Y5S3)" "  Download DXVK" "  Download R6S Global"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto extratools
if %ERRORLEVEL% == 3 goto libdownload
if %ERRORLEVEL% == 4 goto libtwodownload
if %ERRORLEVEL% == 5 goto dxvkdownload
if %ERRORLEVEL% == 6 goto r6globaldownload

:libdownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                          Downloading Liberator...
echo -------------------------------------------------------------------------------
curl -L "https://github.com/SlejmUr/Manifest_Tool_TB/raw/main/R6_Liberator_0.0.0.22.exe" --ssl-no-revoke --output R6_Liberator_0.0.0.22.exe
move R6_Liberator_0.0.0.22.exe Resources
pause
goto extratools

:dxvkdownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                          Downloading DXVK (Vulkan)...
echo -------------------------------------------------------------------------------
curl -L "https://github.com/Vergepoland/r6-downloader/raw/refs/heads/main/Siege-DXVK.zip" --ssl-no-revoke --output Siege-DXVK.zip
::Extract
for %%I in ("Siege-DXVK.zip") do (
"Resources\7z.exe" x -y -o"Resources\Siege-DXVK" "%%I" -aoa && del %%I
)
pause
goto extratools

:libtwodownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                        Downloading Liberator 2...
echo -------------------------------------------------------------------------------
curl -L "https://github.com/Vergepoland/r6-downloader/raw/refs/heads/main/R6Liberator2.exe" --ssl-no-revoke --output R6Liberator2.exe
move R6Liberator2.exe Resources
pause
goto extratools

:r6globaldownload
cls
MODE 79,20
echo -------------------------------------------------------------------------------
echo                          Downloading R6S Global...
echo -------------------------------------------------------------------------------
curl -L "https://github.com/Vergepoland/r6-downloader/raw/refs/heads/main/R6SGlobal.zip" --ssl-no-revoke --output R6SGlobal.zip
::Extract
for %%I in ("R6SGlobal.zip") do (
"Resources\7z.exe" x -y -o"Resources\R6SGlobal" "%%I" -aoa && del %%I
)
pause
goto extratools

:guidefaq
Title Installation Guide and FAQ
cls
MODE 41,10
echo -----------------------------
echo ^| Select an option below... ^|
echo -----------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Main Menu" "  Installation Guide" "  FAQ"
if %ERRORLEVEL% == 1 goto mainmenu
if %ERRORLEVEL% == 2 goto guide
if %ERRORLEVEL% == 3 goto faq

:guide
Title Installation Guide
cls
MODE 134,17
echo --------------------------------------------------------------------------------------------------------------------------------------
echo ^| 1) In the main menu of the downloader, select 'Game Downloader' and choose which version you want to download.                     ^|
echo ^|    Enter the username and password for the Steam account you have a copy of Rainbow Six Siege on, and the download should start.   ^|
echo ^|                                                                                                                                    ^|
echo ^| 2) Once you have that done, launch the game by double-clicking RainbowSix.bat in the 'Downloads' folder where the downloader       ^|
echo ^|    is located. If there is no RainbowSix.bat file, you can launch RainbowSix.exe / RainbowSixGame.exe                              ^|
echo ^|                                                                                                                                    ^|
echo --------------------------------------------------------------------------------------------------------------------------------------
echo ^| Note : To play with other people, download Radmin Server https://radmin-vpn.com/ , then create or join a private network.          ^|
echo ^| Then create or join a local custom game. Ensure you allowed Siege via the firewall in Radmin VPN (System -^> Firewall)             ^|
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
echo ^| # A: Yes it is, you can view the source code for DepotDownloader here: https://github.com/SteamRE/DepotDownloader/                    ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why do I get 'Invalid Password' after entering my Steam credentials?                                                             ^|
echo ^| # A: You need to enter your LEGACY Steam username, not your profile name                                                              ^|
echo ^|     (The username you use to login to Steam, or select the option to login using a qr code in settings)                               ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why does it say 'Download Complete' immediately after entering a download option?                                                ^|
echo ^| # A: You failed to connect to steam in the 3-5 attempts - Select the same season again (or steam is down)                             ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why can't I see my password while I'm typing?                                                                                    ^|
echo ^| # A: For security reasons, you can't enable any setting to see the password                                                           ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Where can I change my name?                                                                                                      ^|
echo ^| # A: In the cplay.ini file                                                                                                            ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why do I have no RainbowSix.exe file?                                                                                            ^|
echo ^| # A: Run the downloader again, selecting the same season (AKA verify files) - ensure you have enough space also                       ^|
echo ^|                                                                                                                                       ^|   
echo ^|   Q: Why am I getting errors during download"?                                                                                        ^|
echo ^| # A: Getting errors while downloading is normal, ignore it (unless you get an error that you're out of storage - yk what to do)       ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why am I getting the error 'Missing xxxxxxxx.dll'                                                                                ^|
echo ^| # A: Ensure you have an antivirus exclusion set (as folder) - turning OFF your antivirus won't do ANYTHING, you MUST set one up.      ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why does the live version or an activation key screen launch when I try to run RainbowSix.exe?                                   ^|
echo ^| # A: Replace cracks from Resources folder OR from the discord server in #guides-and-faqs                                              ^|
echo ^|                                                                                                                                       ^|
echo ^|   Q: Why is my download stuck at X percent?                                                                                           ^|
echo ^| # A: Some files in a season are larger than the rest and may take longer to download, please be patient.                              ^|
echo ^|   Best way to tell if it's still downloading is to check if the progress bar is moving at the taskbar (or the cmd tab on win 11)      ^|
echo -----------------------------------------------------------------------------------------------------------------------------------------
echo.
Resources\cmdMenuSel f870 "  <- Back to Guide and FAQ"
if %ERRORLEVEL% == 1 goto guidefaq

:moresettings
Title Downloader Settings
cls
MODE 81,18
echo.
echo QR Code: %useqr% (default = 0) (0 = no) (1 = yes)
echo Max servers: %maxservers_and_downloads% (Default = 20) (Max = 50)
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