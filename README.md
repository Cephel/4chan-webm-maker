4chan-webm-maker
================
A handy little script that automates most steps involved in creating webm's for the 4chan imageboard. It automatically respects 4chan's filesize limitation for webm's and calculates optimal settings for maximum quality. A five year old could make webm's with this.

Features
--------
- Simple drag and drop functionality. No messing around with the command line or arguments.
- Bundled ffmpeg. No extra stuff to download. Works out of the box.
- Automatic quality settings to attempt to max out file size limitations on 4chan
  - Read: "Tries to make it look as good as possible".
- Easy on-screen prompts to change offset and length of webm rendering. No editing necessary to extract "that one good part".
- Simplified resolution setup. Simply put in the desired vertical resolution ( ie. 720 ) and the script does the rest. Maintains aspect ratio aswell of course.

Usage
-----
1. Download and put the script somewhere.
2. Drag and drop a video file on it.
3. Follow the on-screen instructions.

Dependencies
------------
- ffmpeg ( included )
