#!/bin/bash
for i in "$@"; do
    UNQUOTED=${i:1:-1}
    FILE_PATH=${UNQUOTED#file:\/\/}
   if ! dconf read /org/x/apps/favorites/list | grep -q "$i"; then
     FAVORITES=$(dconf read /org/x/apps/favorites/list | sed 's/^.//;s/.$//') 
     if [ "$FAVORITES" = "as [" ] || [ -z "$FAVORITES" ]; then
       FAVORITES="'$i::inode/directory'"
     else
       FAVORITES="$FAVORITES, '$i::inode/directory'"
     fi
     dconf write /org/x/apps/favorites/list "[$FAVORITES]"
     gio set -t stringv "$FILE_PATH" metadata::xapp-favorite true
   fi
   if ! grep -q "$i" ~/.config/gtk-3.0/bookmarks; then
      echo "$i" >> ~/.config/gtk-3.0/bookmarks
   fi
done
     
     

