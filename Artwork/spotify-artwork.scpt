-- Paths
set BlankArtwork to ((path to home folder) as text) & "myScripts:Spoti-Nerd:Artwork:Default:emptyArt.png"
set OutputArtwork to ((path to home folder) as text) & "myScripts:Spoti-Nerd:Artwork:albumArt.png"
set tmpFile to ((path to home folder) as text) & "myScripts:Spoti-Nerd:Artwork:prevSong.txt"

set unixBlankArtwork to the quoted form of POSIX path of BlankArtwork
set unixOutputArtwork to the quoted form of POSIX path of OutputArtwork

set artCover to "blank"
set currTrackString to ""
set debug to ""

-- Fetch last played song
  try
    set lastTrackString to (read file tmpFile)
  on error
    --set debug to debug & "File can't be read - "
    set lastTrackString to ""
  end try

tell application "System Events"
  if exists process "Spotify" then      -- Spotify is running
    tell application "Spotify"
      if player state is playing then   -- Spotify is playing
        set currTrackString to id of current track as string
        set currTrackArtwork to artwork url of current track
        set artCover to "album"
      end if 
    end tell
  end if
end tell

-- Check if the current track is different from the stored one
if (currTrackString is not lastTrackString) then
  --set debug to debug & "Names were different - "
  -- Store the current track
  set fileRef to (open for access tmpFile with write permission)
  try
    set eof fileRef to 0
    write currTrackString to fileRef
  on error errorMessage
    --set debug to debug & "Error:" & errorMessage & " - "
  end try
  close access fileRef

  if artCover is "album" then             -- Download album artwork
    do shell script "/usr/local/bin/wget " & currTrackArtwork & space & "-O" & space & unixOutputArtwork
  else                                    -- Place blank image
    do shell script "ditto -rsrc " & unixBlankArtwork & space & unixOutputArtwork
  end if
else 
  --set debug to debug & "Names were the same - "
end if

-- Uncomment next line to debug:
-- return debug









