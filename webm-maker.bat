@echo off

:: Necessary for some loop and branching operations ::
setlocal enabledelayedexpansion
:: Max 4chan file size for webm's, slightly reduced because ffmpeg averages the bitrate and it can become slightly bigger than the max size, even with perfect calculation
set max_file_size=3000

:: Check if script was started with a proper parameter ::
if "%~1" == "" (
	echo This script needs to be run by dropping a video file on it. It cannot do anything by itself.
	pause
	goto :EOF
)

:: Time for some setup
cd /d "%~dp0"
:: Ask user how big the webm should be
echo Enter vertical desired resolution. Example: 720 for 720p. Aspect ratio will be maintained. Entering nothing will render at source resolution.
set /p resolution="Enter: " %=%
if not "%resolution%" == "" (
	set resolutionset=-vf scale=-1:%resolution%
)
echo.
:: Ask user where to start webm rendering in source video
echo Enter start of webm rendering in source video in SECONDS. Entering nothing starts render at the start of the video file.
set /p start="Enter: " %=%
if not "%start%" == "" (
	set startset=-ss %start%
)
echo.
:: Ask user for length of rendering
echo Enter desired webm rendering duration in SECONDS. Entering nothing renders the entire file.
set /p length="Enter: " %=%
if not "%length%" == "" (
	set lengthset=-t %length%
) else (
	ffmpeg.exe -i %1 2> webm.tmp
	for /f "tokens=1,2,3,4,5,6 delims=:., " %%i in (webm.tmp) do (
		if "%%i"=="Duration" call :calculatelength %%j %%k %%l %%m
	)
	del webm.tmp
	echo Autodetected length of video to be !length! seconds
)
echo.
:: find bitrate that maxes out max filesize on 4chan, defined above
set /a bitrate=8*%max_file_size%/%length%
echo Target bitrate set to %bitrate%

:: Two stage encoding
ffmpeg.exe -i "%~1" -c:v libvpx -b:v %bitrate%K -quality best %resolutionset% %startset% %lengthset% -an -threads 0 -f webm -pass 1 -y NUL
ffmpeg.exe -i "%~1" -c:v libvpx -b:v %bitrate%K -quality best %resolutionset% %startset% %lengthset% -an -threads 0 -pass 2 -y "%~n1.webm"
del ffmpeg2pass-0.log
goto :EOF

:: Helper function to calculate length of video
:calculatelength
	for /f "tokens=* delims=0" %%a in ("%3") do set /a s=%%a
	for /f "tokens=* delims=0" %%a in ("%2") do set /a s=s+%%a*60
	for /f "tokens=* delims=0" %%a in ("%1") do set /a s=s+%%a*60*60
	set /a length=s