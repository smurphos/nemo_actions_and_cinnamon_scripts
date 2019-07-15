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
    gio set "$DIRS" metadata::nemo-default-view "$2" \; -exec gio set "$DIRS" metadata::nemo-icon-view-zoom-level "$3" \;
    ((COUNT++))
    PROGRESS=$(echo "$COUNT / $INCREMENT" | bc)
    echo "$PROGRESS"
    echo "# $COUNT of $MAX : $PROGRESS% Processing: $(basename "$DIRS")"
    done > >(zenity --progress --auto-close --percentage=0 --time-remaining --text="Applying view preferences to $1 and sub-folders)                                                                              ")
}

# Select a view preference for selected selected directory and sub-directories
VIEW=$(zenity --entry --entry-text="1" --text="Select a view-type for this folder and it's subfolders\n\n1) Icon View\n2) Compact View\n3) List View\n")
if [ -z "$VIEW" ]; then
 exit 1; 
fi
 if [[ ! $VIEW =~ ^[1-3]+$ ]] || [[ $VIEW -lt 1 ]] || [[ $VIEW -gt 3 ]]; then
   zenity --info --width=250 --text="View-type must be an integer in the range 1 to 3. Aborting operation. Please try again.";
 exit 1
fi
# Select a zoom preference for selected directory and sub-directories
ZOOM=$(zenity --entry --entry-text="1" --text="Select a zoom level for this folder and it's subfolders\n\\n0) Smallest\n1) Smaller \n2) Small\n3) Standard\n4) Large \n5) Larger \n6) Largest\n")
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
  set_metadata "$1" "OAFIID:Nemo_File_Manager_Icon_View" "$ZOOM"
  ;;  
2)
  set_metadata "$1" "OAFIID:Nemo_File_Manager_Compact_View" "$ZOOM"
  ;;  
3)
  set_metadata "$1" "OAFIID:Nemo_File_Manager_List_View" "$ZOOM"
  ;;  
esac
# Restart Nemo to apply changes.
if wmctrl -lx | grep nemo.Nemo; then
  nemo -q
  nemo "$(dirname "$1")"
else
  nemo -q
fi
exit
