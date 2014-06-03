4chan-webm-maker
================
A handy little script which automatically finds the necessary encoder file and applies sizing and bitrate options to automize creating webm videos for the 4chan imageboard. Works right out of the box!

Features
--------
- Simple drag and drop functionality. No messing around with the command line and arguments.
- Bundled ffmpeg. No extra stuff to download. Works out of the box.
- Automatic quality settings to attempt to max out file size limitations on 4chan ( ie. "tries to make it look as good as possible" ).
- Length of desired webm video rendering easily changable due to on screen prompts. No editing of video files to "prime" them for webm usage necessary.
- Video offset for start of webm video rendering easily changable with simple onscreen prompts. No cutting up video files prior to rendering them as webm necessary.
- Resolution setup completely automated, just put in the desired vertical resolution and the script does the rest. Maintains aspect ratio aswell.

Usage
-----
1. Put the script somewhere.
2. Drag and drop a video file on it.
3. Follow the on-screen instructions.

Dependencies
------------
- ffmpeg ( bundled )
