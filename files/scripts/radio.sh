
#!/usr/bin/env bash
#
# Script name: Lofi-radio
# Description: Choose between online radio stations with dmenu.
# Dependencies: dmenu, mpv, notify-send


# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail



# The menu of radio station choices
menu() {
  printf "Quit\n"
  printf "1. Lofi Girl Youtube\n"
  printf "2. Synthwave radio\n" # lofi girl youtube channel
  printf "3. jazz/lofi hip hop youtube\n"
  printf "4. Piano Classic Hits\n"
  printf "5. Bach - Violin Concertos\n"
  printf "6. Classical Piano Music youtube\n"
 
}

# Functions for sending notification messages
start_radio() {
  notify-send "Starting Lofi-radio" "Playing station: $1. 🎶"
}

end_radio() {
  notify-send "Stopping Lofi-radio" "You have quit Lofi-radio. 🎶"
}

# Main function. Pipes the menu() function into DMENU.
choice=$(menu | dmenu -i -l 20 -p "Choose Lofi station:" | cut -d. -f1) || exit

# Case statement for making our station choice.
# We only need the number thanks to the cut command above.
case $choice in
  "Quit")
    end_radio ;
    pkill -f http
    exit
    ;;
  1)
    pkill -f http || echo "mpv not running."
    start_radio 'Lofi Girl Youtube' ;
    mpv "https://www.youtube.com/watch?v=jfKfPfyJRdk" --no-video --volume=40
    return
   ;;
  2)
    pkill -f http || echo "mpv not running."
    start_radio 'Lofi-24h' ;
    mpv "https://www.youtube.com/watch?v=4xDzrJKXOOY" --no-video --volume=40
    return
   ;;
  3)
    pkill -f http || echo "mpv not running."
    start_radio 'jazz/lofi radio' ;
    mpv "https://www.youtube.com/watch?v=kgx4WGK0oNU" --no-video --volume=40
    return
   ;;
  4)
    pkill -f http || echo "mpv not running."
    start_radio 'Classic Piano Hits' ;
    mpv "https://zeno.fm/radio/piano-classic-hits/" --volume=40
    return
   ;;
  5)
    pkill -f http || echo "mpv not running."
    start_radio 'Bach - Violin Concertos' ;
    mpv "https://zeno.fm/radio/bach-violin-concertos/" --volume=40
    return
   ;;
  6)
    pkill -f http || echo "mpv not running."
    start_radio 'Classical Piano Music' ;
    mpv "https://www.youtube.com/watch?v=sGHgBP9-zXo" --no-video --volume=40
    return
   ;;

  *)
    echo "Program terminated." && exit 0
    ;;
esac
