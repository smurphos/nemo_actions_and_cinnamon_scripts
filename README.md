# Nemo Actions & Cinnamon Scripts

A collection of custom context menu actions for the Nemo file manager, along with some miscellaneous feature scripts intended for the Cinnamon desktop environment.

# Nemo Actions

Nemo actions add additional context menu items to the right click context menu in the Nemo file manager and on the Cinnamon desktop.

An action can be added to Nemo by saving it's definition file with the file extension `.nemo_action` in `~/.local/share/nemo/actions`

Some actions in this repo also require an associated shell script. These should be saved in `~/.local/share/nemo/actions/scripts` and be made executable

# Cinnamon Scripts

The standalone Cinnamon Scripts should normally be saved in `~/bin` or `~/.local/bin` and be made executable. Please see comment lines in the header of each script for any additional steps needed to install and use the specific script.

## Cinnamon Scripts Index

#### Lock Screen Slideshow

This script adds a user configurable desktop background slideshow function to the native Cinnamon screensaver/screen locker.

[lock_screen_slideshow.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/bin/lock_screen_slideshow.sh)

## Nemo Actions Index

### Desktop context menu actions

#### Close windows actions.

A set of two actions and an associated shell script to allow the user to gracefully close all open windows on the current workspace or all workspaces via right click on the desktop. The script requires wmctrl and xdotool `apt install wmctrl xdotool`

[close_windows_in_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/close_windows_in_workspace.nemo_action)

[close_all_windows.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/close_all_windows.nemo_action)

[close_windows.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/close_windows.sh)

#### Workspace management actions

A set of six actions to allow easy management of workspaces from the desktop context menu. The next and previous workspace actions require xdotool `apt install xdotool`

[new-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/new-workspace.nemo_action)

[delete-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/~/.local/share/nemo/actions/delete-workspace.nemo_action)

[previous_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/previous_workspace.nemo_action)

[next_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/next_workspace.nemo_action)

[workspace_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/workspace_overview.nemo_action)

[window_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/window_overview.nemo_action)

#### Background slide-show actions

An action to quickly toggle the desktop background slide-show, along with an action to select the next wallpaper when the slide-show is active.

[toggle_slideshow.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/toggle_slideshow.nemo_action)

[next-wallpaper.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/next-wallpaper.nemo_action)

#### Session management actions

The first two actions give quick access from the desktop context menu to the shutdown and logoff session dialogues.

[session_menu_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_menu_logout.nemo_action)

[session_menu_poweroff.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_menu_poweroff.nemo_action)

These five actions immediately invoke the requested action.

[session_reboot.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_reboot.nemo_action)

[session_shutdown.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_shutdown.nemo_action)

[session_suspend.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_suspend.nemo_action)

[session_lock.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_lock.nemo_action)

[session_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/session_logout.nemo_action)

### General Actions

#### Open with admin privileges actions

These actions give you a choice of applications to edit text based files with admin privileges.

The sudo_nano action and associated script will open the file in nano a terminal based text editor, elevating privileges only if necessary. 

[sudo_nano.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/sudo_nano.nemo_action)

[sudo_nano_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/scripts/sudo_nano_check.sh)

The xed_admin action and associated script will open the file in the text editor xed elevating privileges with admin:// if necessary.

[xed_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/xed_admin.nemo_action)

[xed_admin_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/xed_admin_check.sh)

#### File actions as admin

These actions and their associated shell scripts allow the user to undertake a range of file management activities with elevated privileges if needed from a regular instance of Nemo.

They will all request password authentication if elevated privileges are necessary to complete the action. All require zenity - `apt install zenity`

##### Copy/paste (Admin)

Supports single and multiple selections. Uses zenity to select destination.

[copy_paste_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/copy_paste_admin.nemo_action)

[copy_paste_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/copy_paste_admin.sh)

##### Cut/paste (Admin)

Supports single and multiple selections. Uses zenity to select destination.

[cut_paste_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/cut_paste_admin.nemo_action)

[cut_paste_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/cut_paste_admin.sh)

##### Creating links (Admin)

Supports single selections only . Uses zenity to select destination.

[create_link_in_target.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/create_link_in_target.nemo_action)

[create_link_in_target.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/create_link_in_target.sh)

##### Create Directory (Admin)

This action has two nemo_action files, one for right-click on a directory, and one for right-click on empty space.

[create_dir_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/create_dir_admin.nemo_action)

[create_dir_admin_background.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/create_dir_admin_background.nemo_action)

[create_dir_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/create_dir_admin.sh)

##### Create File (Admin)

This action has two nemo_action files, one for right-click on a directory, and one for right-click on empty space.

[create_file_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/create_file_admin.nemo_action)

[create_file_admin_background.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/create_file_admin_background.nemo_action)

[create_file_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/create_file_admin.sh)

##### Delete (Admin)

Supports single and multiple selections.

[delete_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/delete_admin.nemo_action)

[delete_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/delete_admin.sh)

##### Rename (Admin)

Supports single selections only.

[rename_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/rename_admin.nemo_action)

[rename_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/rename_admin.sh)

#### Bulk rename actions

Both these actions open the bulk rename utility GPrename - `apt install gprename`. One action is for a single folder selection to bulk rename files in that folder.
The other is for multiple selections and opens GPrename in the parent folder.

[bulk_rename_files.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/bulk_rename_files.nemo_action)

[bulk_rename_folders.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/bulk_rename_folders.nemo_action)

#### Media info

Shows information about media files in a separate window. Requires mediainfo-gui - `apt install mediainfo-gui`.

[media-info.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/~/.local/share/nemo/actions/general_actions/media-info.nemo_action)

#### Search folders

Opens the selected folder in Searchmonkey - `apt install searchmonkey` for more fine-tuned file system searches including search by contents.

[searchmonkey.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/searchmonkey.nemo_action)

#### View a tree-view directory structure in your browser

An action and associated shell script to produce an html tree-view of the directory and file structure below the selected directory. Requires tree - `apt install tree`

[print_tree.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/print_tree.nemo_action)

[print_tree.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/print_tree.sh)

#### Copy a random selection of files from a directory

Ever wanted to grab a random selection of music files or pictures from a collection? This action is for you. Uses zenity - `apt install zenity` to ask the user to confirm number of files and where to paste them.

[get_random_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/get_random_file.nemo_action)

[get_random_files.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/get_random_files.sh)

#### Toggle checked emblem

An action and associated shell script to quickly add or remove a ✓ emblem to the file/folder.

[toggle_checked.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/toggle_checked.nemo_action)

[toggle_checked.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/scripts/toggle_checked.sh)

#### Update a files modification date

[touch_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/~/.local/share/nemo/actions/touch_file.nemo_action)
