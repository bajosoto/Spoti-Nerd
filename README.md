# Spoti-Nerd
A simple customizable widget for Mac. It displays the currently playing on Spotify song and artist name, as well as the artwork on the desktop.

![alt text](https://github.com/bajosoto/Spoti-Nerd/blob/master/Res/screenshot.png "Desktop")

## Instructions
Configuring this tool requires following a simple sequence of steps. The good thing is that you get to customize the look and feel according to your needs!

- Install [Nerd Tool](http://mutablecode.com/apps/nerdtool.html), a simple yet powerful tool allowing to customize and display things on top of your desktop.

- Download or clone this repository in your home folder. You can type the following commands in your Terminal:
```
cd ~/
mkdir myScripts
cd myScripts
git clone git@github.com:bajosoto/Spoti-Nerd.git
```

- Create 4 Logs: 3 Shell and 1 Image
 
![alt text](https://github.com/bajosoto/Spoti-Nerd/blob/master/Res/groupscreen.png "Group")

- In the Log settings for the shell Logs, include the appropriate scpt script:

![alt text](https://github.com/bajosoto/Spoti-Nerd/blob/master/Res/logscreen.png "Log")

```
osascript ~/myScripts/Spoti-Nerd/spotify-song.scpt
```

```
osascript /Users/Sergio/myScripts/Spoti-Nerd/Artwork/spotify-artwork.scpt
```

```
osascript ~/myScripts/Spoti-Nerd/spotify-artist.scpt
```

- For the Image Log, click Browse and locate the file under Spoti-Nerd/Artwork/albumArt.png

- You can set the times for the scripts and image Logs to whatever you feel comfortable with. I have mine set at 2 ~ 3 seconds.

- You're all set! You can customize the size, font, location, color, etc. of the text and album artwork to whatever you like! :wink:

## Credits
This widget was inspired by the work of [Dr. Drang](Dr. Drang). However, since Spotify no longer supports the dictionary property "artwork", none of the current implementations I found online work anymore. This is an improved version that retrieves the image remotely, and also uses less resources by not updating it until the song changes.

