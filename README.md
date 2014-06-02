4chan-webm-maker
================
A handy little script which automatically finds the necessary encoder file and applies sizing and bitrate options to automize creating webm videos for the 4chan imageboard. Works right out of the box!

Features
--------
- Simple drag and drop functionality. No messing around with the command line and arguments.
- Automatic ffmpeg.exe lookup. No modifying of your PATH variable necessary.
- Automatic quality settings to attempt to max out file size limitations on 4chan ( ie. "tries to make it look as good as possible". )
- Length of desired webm video rendering easily changable due to on screen prompts. No editing of video files to "prime" them for webm usage necessary.
- Video offset for start of webm video rendering easily changable with simple onscreen prompts. No cutting up video files prior to rendering them as webm necessary.
- Resolution setup completely automated, just put in the desired vertical resolution and the script does the rest. Maintains aspect ratio aswell.

Usage
-----
1. Download ffmpeg here: http://ffmpeg.zeranoe.com/builds/. This is used to encode videos to the webm format.
  - The script only looks for ffmpeg in the Program Files and Program Files (x86) folders of the **current partition this script is executed in**. This is because looking for the encoder takes way too long otherwise. This means you must install ffmpeg in either location.
  - You can specify a custom location by editing the corresponding line at the top of the script. The script will also look in that location for ffmpeg.exe if you define a custom location.
2. Put the script somewhere you can access it nicely.
  - Make sure the script resides in the same **partition** as your ffmpeg install. This also helps driving down lookup time.
4. Drag a video file onto the script.
5. Follow the on-screen instructions.

Dependencies
------------
- ffmpeg
