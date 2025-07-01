#!/bin/bash

# Get the current Spotify track information
SPOTIFY_STATE=$(osascript -e 'tell application "Spotify" to get player state')

if [ "$SPOTIFY_STATE" = "playing" ] || [ "$SPOTIFY_STATE" = "paused" ]; then
  ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
  TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
  
  # Truncate long track and artist names
  if [ ${#TRACK} -gt 20 ]; then
    TRACK="$(echo $TRACK | cut -c 1-20)..."
  fi
  
  if [ ${#ARTIST} -gt 20 ]; then
    ARTIST="$(echo $ARTIST | cut -c 1-20)..."
  fi
  
  sketchybar --set $NAME label="♫ $ARTIST - $TRACK"
else
  sketchybar --set $NAME label="♫"
fi
