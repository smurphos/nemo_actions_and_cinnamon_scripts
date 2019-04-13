#!/bin/dash
for i in "$@"; do
 tree "$i" --si --sort=size -H "$i" -o /tmp/"$(basename "$i")".html
 xdg-open /tmp/"$(basename "$i")".html
done
exit
  

   
