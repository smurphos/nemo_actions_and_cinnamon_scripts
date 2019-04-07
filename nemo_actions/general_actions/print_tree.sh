#!/bin/dash
if [ ! -d ~/.tree_output ]; then
  mkdir ~/.tree_output
fi
for i in "$@"; do
 tree "$i" --si --sort=size -H "$i" -o ~/.tree_output/"$(basename "$i")".html
 xdg-open ~/.tree_output/"$(basename "$i")".html
done
exit
  

   
