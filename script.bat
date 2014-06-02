@echo off

:: Necessary for some loop and branching operations ::
setlocal enabledelayedexpansion
:: Max 4chan file size for webm's
set max_file_size=3072

:: Check if script was started with a proper parameter ::
if "%1" == "" (
	echo - This script needs to be run by dropping a video file on it. It cannot do anything by itself.
	pause
	goto :EOF
)

:: Find ffmpeg folder and its binary file ::
echo - Finding ffmpeg.exe
cd %~d0\
cd "Program Files"
echo - Looking up "%~d0\Program Files"
for /f "delims=" %%f in ('dir /s /b /a-d "ffmpeg.exe"') do (set encoder=%%f)
if not "%encoder%" == "" ( 
	echo - Found encoder at %encoder%
) else (
	cd %~d0\
	cd "Program Files (x86)"
	echo - Trying "!cd!" instead
	for /f "delims=" %%f in ('dir /s /b /a-d "ffmpeg.exe"') do (set encoder=%%f)
	if not "!encoder!" == "" (
		echo - Found encoder at !encoder!
	) else (
		echo - Nothing found, install ffmpeg first, then try again
		pause
		:: exit script
		exit
	)
)

:: Ffmpeg was found at this point, time for some setup
cd %~d0\
cd %~p0
:: Ask user where to start webm rendering in source video
echo - Enter start of webm rendering in source video in SECONDS
set /p start="Enter: " %=%
:: Ask user for length of rendering
echo - Enter desired webm rendering duration in SECONDS
set /p length="Enter: " %=%
:: find bitrate that maxes out max filesize on 4chan, defined above
set /a bitrate=8*%max_file_size%/%length%
echo - Target bitrate set to %bitrate%

:: Two stage encoding
"%encoder%" -i %1 -c:v libvpx -b:v %bitrate%k -vf scale=-1:720 -crf 10 -ss %start% -t %length% -an -threads 0 -f webm -pass 1 -y NUL
"%encoder%" -i %1 -c:v libvpx -b:v %bitrate%k -vf scale=-1:720 -crf 10 -ss %start% -t %length% -an -threads 0 -pass 2 -y "%~n1.webm"
del ffmpeg2pass-0.log

echo.
echo DONE!
pause