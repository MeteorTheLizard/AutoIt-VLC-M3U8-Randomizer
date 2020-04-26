# AutoIt-VLC-M3U8-Randomizer

This is a script that randomizes the order of entries in a M3U8 Playlist file created with the VLC Player. It is possible that it can randomize other M3U8 Playlists as well but this was only tested with the playlists created by the VLC Player.

This Script cannot be compiled to an .exe as the source code requires changes in order for it to work.

## Using the script

[Get AutoIt Here](https://www.autoitscript.com/site/autoit-script-editor/downloads/)

- This Script requires AutoItv3 to be installed. The recommended Editor is SciTE but other properly configured editors such as Sublime and even Notepad++ can be used.

To use this script, change the line **10** to have the path to your playlist file and then run the script. The script will output a new file in the directory where your playlist is located at with shuffled entries.

**IMPORTANT: After choosing the directory, before the file name, there HAS to be a "/" Example: "/Longplay.m3u8" it cannot be a "\" as this causes issues with the program! It's also important to note that original backslashes cannot be replaced with a slash as this causes issues as well.**

A proper formatted path looks like this: **C:\Users\RX1500x-METEOR\Desktop/Longplay.m3u8**
