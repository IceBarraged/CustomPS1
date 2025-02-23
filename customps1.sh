#!/bin/bash

#gets the longest part of a text input, outputs an integer.
len()
{
  echo "$1" | awk '{print length}' | sort -nu | tail -n 1
}

#calculates padding to center text based on string length
center()
{
  if (( "$1" > "$term_width" )); then
    echo 0
  else
    echo $(( ("$term_width" - "$1") / 2 ))
  fi
}

customps1_ascii="
  _______  ________________  __  ______  _______
 / ___/ / / / __/_  __/ __ \/  |/  / _ \/ __<  /
/ /__/ /_/ /\ \  / / / /_/ / /|_/ / ___/\ \ / /
\___/\____/___/ /_/  \____/_/  /_/_/  /___//_/

"
mylink="https://github.com/IceBarraged"

#get terminal width and create a line of # that fills the entire terminal width
term_width=$(tput cols)
hashline=$(printf "#%.0s" $(seq 1 $term_width))

art_width=$(len "$customps1_ascii")

#logic in case screen width is less than the ascii art length
if [ "$art_width" -lt "$term_width" ]; then

  #get padding for ascii 
  spaces_ascii=$(center "$art_width")

  #get length and padding of mylink
  mylink_width=$(len "$mylink")
  spaces_mylink=$(center "$mylink_width")

  #print centered welcome message
  echo "$hashline"

  while IFS= read -r line; do
    printf "%${spaces_ascii}s%s\n" "" "$line"
  done <<< "$customps1_ascii"

  printf "%${spaces_mylink}s%s\n" "" "$mylink"
  echo "$hashline"

else

  #print ascii on left
  echo "$hashline"
  echo "$customps1_ascii"
  echo "$mylink"
  echo "$hashline"

fi
