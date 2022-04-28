#!/bin/bash

#Shell script for nemo action apply_folder_view recursively
#Requires zenity - apt install zenity
#Requires wmctrl - apt install wmctrl

# Function to set metadata with progress indicator
function set_metadata {
	COUNT=0
    PROGRESS=0
    MAX=$(find -L "$1" -type d | wc -l)
    INCREMENT=$(echo "scale=2;$MAX / 100" | bc)
    find -L "$1" -type d -print0 | while IFS= read -r -d $'\0' DIRS; do
    gio set "$DIRS" metadata::nemo-default-view "$2"
    gio set "$DIRS" $3
    ((COUNT++))
    PROGRESS=$(echo "$COUNT / $INCREMENT" | bc)
    echo "$PROGRESS"
    echo "# $COUNT of $MAX : $PROGRESS% Processing: $(basename "$DIRS")"
    done > >(zenity --progress --auto-close --percentage=0 --time-remaining --text="Applying view preferences to $1 and sub-folders)                                                                              ")
}

# Select a view preference for selected selected directory and sub-directories
VIEW=$(zenity --entry --entry-text="1" --title="Select view type" --text="Select a view type for $1/*\nEnter 1, 2 or 3\n\n1- Icon View\n2- Compact View\n3- List View\n")
if [ -z "$VIEW" ]; then
 exit 1; 
fi
 if [[ ! $VIEW =~ ^[1-3]+$ ]] || [[ $VIEW -lt 1 ]] || [[ $VIEW -gt 3 ]]; then
   zenity --info --width=250 --text="View-type must be an integer in the range 1 to 3. Aborting operation. Please try again.";
 exit 1
fi
# Select a zoom preference for selected directory and sub-directories
ZOOM=$(zenity --entry --entry-text="1" --title="Select zoom level" --text="Select a zoom level for $1/*\n\Enter 0, 1, 2, 3, 4, 5 or 6\n\n\n0- 33%\n1- 50% \n2- 66%\n3- 100%\n4- 150% \n5- 200% \n6- 400%\n")
if [ -z "$ZOOM" ]; then
 exit 1; 
fi
 if [[ ! $ZOOM =~ ^[0-6]+$ ]] || [[ $ZOOM -lt 0 ]] || [[ $ZOOM -gt 6 ]]; then
   zenity --info --width=250 --text="Zoom must be an integer in the range 0 to 6. Aborting operation. Please try again.";
 exit 1
fi
# Apply choices via set_metadata function
case $VIEW in
1)
  set_metadata "$1" "OAFIID:Nemo_File_Manager_Icon_View" "metadata::nemo-icon-view-zoom-level $ZOOM"
  ;;  
2)
  set_metadata "$1" "OAFIID:Nemo_File_Manager_Compact_View" "metadata::nemo-compact-view-zoom-level $ZOOM"
  ;;  
3)
  set_metadata "$1" "OAFIID:Nemo_File_Manager_List_View" "metadata::nemo-list-view-zoom-level $ZOOM"
  ;;  
esac
# Restart Nemo to apply changes.
if wmctrl -lx | grep nemo.Nemo; then
  nemo -q
  nemo "$(dirname "$1")" &
else
  nemo -q
fi
