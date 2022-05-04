#!/bin/bash
for i in "$@"; do
   if dconf read /org/x/apps/favorites/list | grep -q "$i" && grep -q "$i" ~/.config/gtk-3.0/bookmarks; then 
     RESULT="1"
     continue
   else 
     RESULT="0"
   break
   fi
done
exit "$RESULT"
