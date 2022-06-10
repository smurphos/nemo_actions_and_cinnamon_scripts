# Nemo Actions & Cinnamon Scripts

A collection of custom context menu actions for the Nemo file manager, along with some [miscellaneous feature scripts](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts) intended for the Cinnamon desktop environment.

Also included is a [GTK over-ride](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#miscellaneous-tweaks) file to increase the width of GTK application scrollbars, improve the visibility of labels on desktop icons, and improve the visibility of text on the cinnamon lock-screen / screen-saver.

# Nemo Actions

Nemo actions add additional context menu items to the right click menu in the Nemo file manager and on the Cinnamon desktop.

An action can be added to Nemo by saving it's definition file with the file extension `.nemo_action` in `~/.local/share/nemo/actions`

Some actions in this repo also require an associated shell script. These should be saved in `~/.local/share/nemo/actions/action_scripts` and be made executable

## Nemo Action installation

These instructions assume a Debian/Ubuntu based distro for the commands to install dependencies. For users of other distros please replace `sudo apt` with the equivalent for your distro's package management system.

First install git

`sudo apt install git`

Then clone this repo

`git clone https://github.com/smurphos/nemo_actions_and_cinnamon_scripts.git`

Having cloned the repo you can either install all of the actions using the commands below or refer to the index of actions to install individual actions.

To install all of the nemo actions

`cp -rv ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/ ~/.local/share/nemo`

Install other dependencies used by the actions

`sudo apt install zenity xdotool wmctrl mediainfo-gui shellcheck tree imagemagick`

Either `sudo apt install xplayer` or `sudo apt install totem`

Open Nemo > Preferences > Plugins and review any actions you wish to disable.

## Nemo Action updating

In a terminal navigate to the `nemo_actions_and_cinnamon_scripts` folder created when you originally cloned the repo

e.g `cd nemo_actions_and_cinnamon_scripts`

Once in the correct folder update your local copy with the latest commits, before reinstalling your actions.

`git pull origin; cd ..`

## Nemo Actions Index

## Desktop context menu actions

### Close windows actions.

A set of two actions and an associated shell script to allow the user to gracefully close all open windows on the current workspace or all workspaces via right click on the desktop.

[close_windows_in_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/close_windows_in_workspace.nemo_action)

[close_all_windows.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/close_all_windows.nemo_action)

[close_windows.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/close_windows.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/close_windows_in_workspace.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/close_all_windows.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/close_windows.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install xdotool wmctrl`

### Workspace management actions

A set of six actions to allow easy management of workspaces from the desktop context menu.

[new-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/new-workspace.nemo_action)

[delete-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/.local/share/nemo/actions/delete-workspace.nemo_action)

[previous_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/previous_workspace.nemo_action)

[next_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/next_workspace.nemo_action)

[workspace_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/workspace_overview.nemo_action)

[window_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/window_overview.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/new-workspace.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/delete-workspace.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/previous_workspace.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/next_workspace.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/workspace_overview.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/window_overview.nemo_action ~/.local/share/nemo/actions`

### Background slide-show actions

An action to quickly toggle the desktop background slide-show.

[toggle_slideshow.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/toggle_slideshow.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/toggle_slideshow.nemo_action ~/.local/share/nemo/actions`

An action to select the next-wallpaper in the desktop slide-show - if the slide-show is currently disabled this action will also 
enable the slide-show.

[next-wallpaper.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/next-wallpaper.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/next-wallpaper.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/next-wallpaper.sh ~/.local/share/nemo/actions/action_scripts`

An action to open the current wallpaper's directory in the file manager, or in the default image viewing application. Requires zenity.

[open-wallpaper.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/open-wallpaper.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/open-wallpaper.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/open-wallpaper.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### Session management actions

The first two actions give quick access from the desktop context menu to the shutdown and logoff session dialogues.

[session_menu_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_menu_logout.nemo_action)

[session_menu_poweroff.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_menu_poweroff.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_menu_logout.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_menu_poweroff.nemo_action ~/.local/share/nemo/actions`

These five actions immediately invoke the requested action.

[session_reboot.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_reboot.nemo_action)

[session_shutdown.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_shutdown.nemo_action)

[session_suspend.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_suspend.nemo_action)

[session_lock.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_lock.nemo_action)

[session_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/session_logout.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_reboot.nemo_action~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_shutdown.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_suspend.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_lock.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/session_logout.nemo_action ~/.local/share/nemo/actions`

## General Actions

### Add to Favourites and Bookmarks

An action to add a single or multiple selection of directories to nemo bookmarks and nemo favourites. Main use case is for those who use tree-view in the side-pane where favourites but not bookmarks is available to maintain a synced selection of favourites and bookmarks.

[bookmark_favourite.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/bookmark_favourite.nemo_action)

[bookmark_favourite.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/bookmark_favourite.sh)

[check_bookmark_favourite.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/check_bookmark_favourite.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/bookmark_favourite.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/bookmark_favourite.sh ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/check_bookmark_favourite.sh ~/.local/share/nemo/actions/action_scripts`

### Attach to Email Actions

Nemo's native Send in Email action was removed in Nemo 4.8. Here are two potential replacements. The first one is specific to Thunderbird as an email client. The second is generic and uses xdg-email and has been tested with both Thunderbird and Evolution. Please note that on some distros xdg-email may have been patched to remove the ability to add attachments. At time of writing xdg-email does work on Linux Mint 20.x

[attach_to_email_tbird.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/attach_to_email_tbird.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/attach_to_email_tbird.nemo_action ~/.local/share/nemo/actions`

[attach_to_email_xdg-email.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/attach_to_email_xdg-email.nemo_action)

[attach_to_email_xdg-email.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/attach_to_email_xdg-email.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/attach_to_email_xdg-email.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/attach_to_email_xdg-email.sh ~/.local/share/nemo/actions/action_scripts`

### Edit as other user actions

These actions allow you to open text files with a password prompt for elevated privileges if necessary from a regular instance of Nemo. They will all open the file with the specified text-editor using sudoedit to elevate privileges as the owner of the file if that is not the user. The could be as root or another user on the system.

Three versions are supplied, using the CLI text editor Nano, Linux Mint's default GUI text editor Xed and finally the GUI text editor Geany. If you have a different preferred text editor the actions and scripts can easily be modified to suit your needs. The actions invoking a GUI text editor require zenity.

[nano_sudoedit.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/nano_sudoedit.nemo_action)

[nano_sudoedit_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/nano_sudoedit_check.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/nano_sudoedit.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/nano_sudoedit_check.sh ~/.local/share/nemo/actions/action_scripts`

[xed_sudoedit.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/xed_sudoedit.nemo_action)

[xed_sudoedit_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/xed_sudoedit_check.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/xed_sudoedit.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/xed_sudoedit_check.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

[geany_sudoedit.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/geany_sudoedit.nemo_action)

[geany_sudoedit_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/geany_sudoedit_check.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/geany_sudoedit.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/geany_sudoedit_check.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### File actions as admin

These actions and their associated shell scripts allow the user to undertake a range of file management activities with elevated privileges if needed from a regular instance of Nemo.

They will all request password authentication if elevated privileges are necessary to complete the action.

All require zenity.

### Copy to (Admin)

Supports single and multiple selections.

[copy_to_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/copy_to_admin.nemo_action)

[copy_to_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/copy_to_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/copy_to_admin.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/copy_to_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Move to (Admin)

Supports single and multiple selections

[move_to_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/move_to_admin.nemo_action)

[move_to_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/move_to_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/move_to_admin.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/move_to_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Creating links (Admin)

Supports single selections only. Create a link to a file / folder in a directory of your choice.

[create_link_in_target.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_link_in_target.nemo_action)

[create_link_in_target.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/create_link_in_target.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_link_in_target.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/create_link_in_target.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Create Directory (Admin)

This action has two nemo_action files, one for right-click on a directory, and one for right-click on empty space.

[create_dir_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_dir_admin.nemo_action)

[create_dir_admin_background.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_dir_admin_background.nemo_action)

[create_dir_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/create_dir_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_dir_admin.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_dir_admin_background.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/create_dir_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Create File (Admin)

This action has two nemo_action files, one for right-click on a directory, and one for right-click on empty space.

[create_file_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_file_admin.nemo_action)

[create_file_admin_background.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_file_admin_background.nemo_action)

[create_file_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/create_file_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_file_admin.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_file_admin_background.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/create_file_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Delete (Admin)

Supports single and multiple selections.

[delete_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/delete_admin.nemo_action)

[delete_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/delete_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/delete_admin.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/delete_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Rename (Admin)

Supports single selections only.

[rename_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/rename_admin.nemo_action)

[rename_admin.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/rename_admin.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/rename_admin.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/rename_admin.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Take Ownership (Admin)

Quickly bring files or directories under the current user's ownership.  Supports single and multiple selections of files and directories. For multiple selections will display if at least one selection is not under the users ownership. If directories are included in the selection the user is given the option to take ownership recursively.

[take_ownership.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/take_ownership.nemo_action)

[take_ownership.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/take_ownership.sh)

[check_ownership.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/check_ownership.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/take_ownership.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/take_ownership.sh ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/check_ownership.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Make Executable (Admin)

Quickly add executable bit to files.  Supports single and multiple selections. For multiple selections will display if at least one selection is not currently executable.

[make_executable.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/make_executable.nemo_action)

[make_executable.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/make_executable.sh)

[check_not_executable.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/check_not_executable.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/make_executable.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/make_executable.sh ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/check_not_executable.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/zenity_askpass.sh ~/.local/share/nemo/actions/action_scripts`

### Disk Usage action

Select single or multiple files / directories to be presented with a zenity window showing the total disk usage of the selection.
Based on an action by Linux Mint forum member [sadhu](https://forums.linuxmint.com/memberlist.php?mode=viewprofile&u=129286)

[disk_usage.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/disk_usage.nemo_action)

[disk_usage.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/disk_usage.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/disk_usage.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/disk_usage.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### File metadata action

Select single files / directories to be presented with a zenity window summarising the gvfs metadata associated with file.

[show_metadata.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/show_metadata.nemo_action)

[show_metadata.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/show_metadata.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/show_metadata.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/show_metadata.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### Show parent package action

Select single files or directories to be presented with a zenity window stating which debian package(s) installed the file or has content in the folder.
This action is only for nemo installed on Debian based systems

[show_parent_package.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/show_parent_package.nemo_action)

[show_parent_package.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/show_parent_package.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/show_parent_package.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/show_parent_package.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### Create link on desktop

An action to quickly create a symlink on the Desktop to any single file or folder selection

[create_link_on_desktop.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/create_link_on_desktop.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/create_link_on_desktop.nemo_action ~/.local/share/nemo/actions`

### Apply custom emblems

This action allows the user to create and set custom emblems derived from image files, album art or video thumbnails to files and directories.
For directories there is an option to use a random emblem generated from the directory contents and it can be run recursively on the selected directory and it's sub-directories.

Requires zenity, wmctrl, imagemagick and either xplayer or totem to be installed.

[apply_custom_emblem.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/apply_custom_emblem.nemo_action)

[apply_custom_emblem.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/apply_custom_emblem.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/apply_custom_emblem.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/apply_custom_emblem.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity wmctrl imagemagick`

Either `sudo apt install xplayer` or `sudo apt install totem`

### Apply custom icon

This action action provides an alteranative to the stock icon picker to quickly apply an image as a custom icon for a file or directory. Requires zenity.

[apply_custom_icon.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/apply_custom_icon.nemo_action)

[apply_custom_icon.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/apply_custom_icon.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/apply_custom_icon.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/apply_custom_icon.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### Set folder view recursively

This action allows the user to set default folder view (list, compact or icon) and zoom level recursively to a directory and it's sub-directories.

Requires zenity, wmctrl, and gio. Mint users should be aware that gio is only available in Mint 19 and later.

[set_folder_view_recursively.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/set_folder_view_recursively.nemo_action)

[set_folder_view_recursively.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/set_folder_view_recursively.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/set_folder_view_recursively.nemo_action ~/.local/share/nemo/actions`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/set_folder_view_recursively.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity wmctrl`

### Media info

Shows information about media files in a separate window using mediainfo-gui - .

[media-info.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/.local/share/nemo/actions/general_actions/media-info.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/media-info.nemo_action ~/.local/share/nemo/actions`

`sudo apt install mediainfo-gui`

### View a tree-view directory structure in your browser

An action and associated shell script to produce an html tree-view of the directory and file structure below the selected directory. Requires tree - `sudo apt install tree`

[print_tree.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/print_tree.nemo_action)

[print_tree.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/print_tree.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/print_tree.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/print_tree.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install tree`

### Copy a random selection of files from a directory

Ever wanted to grab a random selection of music files or pictures from a collection? This action is for you.
Uses zenity to ask the user to confirm number of files and where to paste them.

[get_random_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/get_random_file.nemo_action)

[get_random_files.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/get_random_files.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/get_random_file.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/get_random_files.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install zenity`

### Toggle checked emblem

An action and associated shell script to quickly add or remove a ✓ emblem to the file/folder.

[toggle_checked.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/toggle_checked.nemo_action)

[toggle_checked.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/toggle_checked.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/toggle_checked.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/toggle_checked.sh ~/.local/share/nemo/actions/action_scripts`

### Update a file's modification date

[touch_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/touch_file.nemo_action)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/touch_file.nemo_action ~/.local/share/nemo/actions`

### Check a shell script for errors

This action and associated shell script will check your shell scripts for errors with shellcheck.
Scripts with no issues will be marked with a checked emblem, scripts with warnings will be marked with a warning emblem and the shellcheck output along with the shell script itself will be opened in a text editor for review.

[shellcheck.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/shellcheck.nemo_action)

[shellcheck.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/action_scripts/shellcheck.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/toggle_checked.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/action_scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/action_scripts/toggle_checked.sh ~/.local/share/nemo/actions/action_scripts`

`sudo apt install shellcheck`

### Make a PDF out of images

This action and associated shell script uses ImageMagick's `convert` tool to make a PDF out of the selected images and save it to the current directory.
The PDF will bear the first selected file's name followed by a random number to prevent any overwriting. To disable the random number feature, remove `_$RANDOM` from the shell script and save the file.
Your original images will NOT be destroyed.

[Convert-images-to-pdf.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/Convert-images-to-pdf.nemo_action)

[convert_images_to_PDF.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/share/nemo/actions/scripts/convert_images_to_PDF.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#nemo-action-installation)

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/Convert-images-to-pdf.nemo_action ~/.local/share/nemo/actions`

`mkdir -p ~/.local/share/nemo/actions/scripts`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/share/nemo/actions/scripts/convert_images_to_PDF.sh ~/.local/share/nemo/actions/scripts`

`sudo apt install imagemagick`

# Cinnamon Scripts

This is a small selection of feature scripts that add new features or improve existing features for the Cinnamon desktop.

## Cinnamon Scripts Installation

These instructions assume a Debian/Ubuntu based distro for the commands to install dependencies. For users of other distros please replace `sudo apt` with the equivalent for your distro's package management system.

They also assume your distro is set up to automatically add `~/.local/bin/` to your $PATH when it exists. This is the case in Linux Mint main edition but not LMDE for example.

If after installation scripts are not autostarting on login check the output of `echo $PATH`. If the output does not include `~/.local/bin/` this can normally be rectified by adding the string `PATH=~/.local/bin/:$PATH` to `~/.profile`

First install git

`sudo apt install git`

Then clone this repo if you haven't already.

`git clone https://github.com/smurphos/nemo_actions_and_cinnamon_scripts.git`

Having cloned the repo you can either install all of the scripts using the commands below or refer to the index of scripts to install individual scripts.

To install all of the cinnamon scripts

`cp -rv ./nemo_actions_and_cinnamon_scripts/.local/bin/ ~/.local`

`sudo cp -r ./nemo_actions_and_cinnamon_scripts/opt/login_screen_random_background.sh /opt`

To install autostart entries for relevant scripts

`cp -rv ./nemo_actions_and_cinnamon_scripts/.config/autostart/ ~/.config`

Install dependencies required by the scripts

`sudo apt install zenity xdotool wmctrl`

See the scripts index for any other script specific setup recommendations.

Log off and back on.

## Cinnamon Script updating

In a terminal navigate to the `nemo_actions_and_cinnamon_scripts` folder created when you originally cloned the repo

e.g `cd nemo_actions_and_cinnamon_scripts`

Once in the correct folder update your local copy with the latest commits, before reinstalling your scripts.

`git pull origin; cd ..`

## Cinnamon Scripts Index

### Lock Screen Slideshow

This script adds a user configurable desktop background slideshow function to the native Cinnamon screensaver/screen locker.
It is intended to be run on user login as a startup application.

[lock_screen_slideshow.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/bin/lock_screen_slideshow.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts-installation)

`mkdir -p ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/bin/lock_screen_slideshow.sh ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.config/autostart/lock_screen_slideshow.desktop ~/.config/autostart`

Optionally review the script to amend end user editable variables to suit your preferences.

`xdg-open ~/.local/bin/lock_screen_slideshow.sh`

Logout and log back in.

### Login Screen Random Background

This script facilitates the user being presented with a random background on the login screen. It is compatible with any Mint edition using Slick-Greeter and LightDM, not just Cinnamon.
It is intended to be run from the root crontab.

[login_screen_random_background.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/opt/login_screen_random_background.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts-installation)

`sudo cp -r ./nemo_actions_and_cinnamon_scripts/opt/login_screen_random_background.sh /opt`

Optionally review the script to amend end user editable variables to suit your preferences.

`sudoedit /opt/login_screen_random_background.sh`

Login Screen Random Background is intended to be run from the root crontab. To set up run

`sudo crontab -e`

In the CLI text editor that opens add the following lines to the bottom of the file.
Ctrl-O, Enter, Ctrl-X to save the new crontab entries. This will run the script on boot and every half an hour.

```
@reboot /opt/login_screen_random_background.sh
0,30 * * * * /opt/login_screen_random_background.sh
```

### Workspace Background Switcher

This script allows the user to different backgrounds for each Cinnamon workspace. It is intended to be run on user login as a startup application.

[workspace_background_switcher.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/bin/workspace_background_switcher.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts-installation)

`mkdir -p ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/bin/workspace_background_switcher.sh ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.config/autostart/workspace_background_switcher.desktop ~/.config/autostart`

Optionally review the script to amend end user editable variables to suit your preferences.

`xdg-open ~/.local/bin/workspace_background_switcher.sh`

### Opacify Windows

This script allows the user to set default opacity levels for open windows based on the window status and type. For example unfocused windows can be translucent whilst focused windows are opaque.
The effect is independent of the users theme and can be used with any GTK theme. It is intended to be run on user login as a startup application. Requires xdotool and wmctrl - `sudo apt install xdotool wmctrl`

[opacify_windows.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/bin/opacify_windows.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts-installation)

`mkdir -p ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/bin/opacify_windows.sh ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.config/autostart/opacify_windows.desktop ~/.config/autostart`

`sudo apt install xdotool wmctrl`

Optionally review the script to amend end user editable variables to suit your preferences.

`xdg-open ~/.local/bin/opacify_windows.sh`

### Battery Event Warnings

This script uses zenity - `sudo apt install zenity` to open a warning window on battery low and critically low events. This can be helpful if gaming or watching full screen video whilst running on battery as the zenity window will demand attention.
It is intended to be run on user login as a startup application. Please note the script modifies Cinnamon's default thresholds for Low & Critical battery events and actions. Please review the script if you want to set these thresholds to your preference.

[battery_mon.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.local/bin/battery_mon.sh)

To install after [cloning repo](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts#cinnamon-scripts-installation)

`mkdir -p ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.local/bin/battery_mon.sh ~/.local/bin`

`cp -r ./nemo_actions_and_cinnamon_scripts/.config/autostart/battery_mon.desktop ~/.config/autostart`

`sudo apt install zenity`

Optionally review the script to amend end user editable variables to suit your preferences.

`xdg-open ~/.local/bin/battery_mon.sh`

# Miscellaneous tweaks

## GTK over-ride for Cinnamon

This small gtk.css file over-rides is intended to improve visibility of desktop icon labels and screen-saver / screen-locker text on light coloured backgrounds. It also increases the width of scroll bars in GTK3 apps and allows the scrollbars size to vary with changes in text scaling factor.

[gtk.css](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/.config/gtk-3.0/gtk.css)

## Installation

First clone this repo if you haven't already.

`git clone https://github.com/smurphos/nemo_actions_and_cinnamon_scripts.git`

To install the gtk.css over-ride file

`cp -rv ./nemo_actions_and_cinnamon_scripts/.config/gtk-3.0/ ~/.config`

Log off and back on.


