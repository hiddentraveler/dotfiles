
#!/bin/bash
DESKTOP_FILES="$(du -ha /usr/share/applications/ | grep .desktop | awk '{print $2}')"
declare -A HASHMAP
for FILE in $DESKTOP_FILES
do
        APP_NAME="$(cat $FILE | grep Name= | sed 's/Name=//g' | head -1)"
        if [ "$APP_NAME" == "" ]; then
            APP_NAME="$(sed 's/\/usr\/share\/applications\//$FILE/g')"
        fi
        HASHMAP["$APP_NAME"]=$FILE
done
SELECTION=$(printf "%s\n" "${!HASHMAP[@]}" | dmenu -i -l 15 -fn 'SF Mono' -fn monospace-14)
gtk-launch "$(echo ${HASHMAP[$SELECTION]} | sed 's/\/usr\/share\/applications\///g')"
exit
