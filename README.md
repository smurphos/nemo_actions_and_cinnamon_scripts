# Nemo Actions & Cinnamon Scripts

A collection of custom context menu actions for the Nemo file manager, along with some miscellaneous feature scripts intended for the Cinnamon desktop environment.

# Nemo Actions

To install any particular action the `foo.nemo_action` file should be saved in `~./local/share/nemo/actions`

Some of the actions in this repo also have an associated shell script. In all cases that script should also be saved in `~./local/share/nemo/actions` and be made executable.

Two of the actions in this repo which allow users to open files owned by root with elevated privileges in a text-editor require a valid polkit policy for the text editor to be installed in `/usr/share/polkit-1/actions`. These can be found [here](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/tree/master/nemo_actions/usr/share/polkit-1/actions)

## Nemo Actions index

### Desktop context menu actions

#### Close windows actions.

A set of two actions and an associated shell script to allow the user to gracefully close all open windows on the current workspace or all workspaces via right click on the desktop. The script requires wmctrl and xdotool `apt install wmctrl xdotool`

[close_windows_in_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/close_windows_in_workspace.nemo_action)

[close_all_windows.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/close_all_windows.nemo_action)

[close_windows.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/close_windows.sh)

#### Workspace management actions

A set of six actions to allow easy management of workspaces from the desktop context menu. The next and previous workspace actions require xdotool `apt install xdotool`

[new-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/new-workspace.nemo_action)

[delete-workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/delete-workspace.nemo_action)

[previous_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/previous_workspace.nemo_action)

[next_workspace.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/next_workspace.nemo_action)

[workspace_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/workspace_overview.nemo_action)

[window_overview.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/window_overview.nemo_action)

#### Background slide-show actions

An action to quickly toggle the desktop background slide-show, along with an action to select the next wallpaper when the slide-show is active.

[toggle_slideshow.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/toggle_slideshow.nemo_action)

[next-wallpaper.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/next-wallpaper.nemo_action)

#### Session management actions

The first two actions give quick access from the desktop context menu to the shutdown and logoff session dialogues.

[session_menu_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_menu_logout.nemo_action)

[session_menu_poweroff.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_menu_poweroff.nemo_action)

These five actions immediately invoke the requested action.

[session_reboot.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_reboot.nemo_action)

[session_shutdown.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_shutdown.nemo_action)

[session_suspend.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_suspend.nemo_action)

[session_lock.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_lock.nemo_action)

[session_logout.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/desktop_only_actions/session_logout.nemo_action)

### General Actions

#### Open with admin privileges actions

These actions give you a choice of actions for right click on a text based file to edit with admin privileges.

The sudo_nano action and associated script will open the file in nano a terminal based text editor, elevating privileges only if necessary. 

[sudo_nano.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/sudo_nano.nemo_action)

[sudo_nano_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/sudo_nano_check.sh)

The xed_admin action and associated script will open the file in the text editor xed elevating privileges with admin:// if necessary.

[xed_admin.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/xed_admin.nemo_action)

[xed_admin_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/xed_admin_check.sh)

The xed_pkexec action and associated script will open the file in the text editor xed elevating privileges with polkit if necessary. It requires a polkit policy to be installed for xed in `usr/share/polkit-1/actions`

[xed_pkexec.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/xed_pkexec.nemo_action)

[xed_pkexec_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/xed_pkexec_check.sh)

[user.added.pkexec.xed.policy](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/usr/share/polkit-1/actions/user.added.pkexec.xed.policy)

The geany_pkexec action and associated script will open the file in the text editor geany `apt install geany`, elevating privileges with polkit if necessary. It requires a polkit policy to be installed for geany in `usr/share/polkit-1/actions`

[geany_pkexec.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/geany_pkexec.nemo_action)

[geany_pkexec_check.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/geany_pkexec_check.sh)

[user.added.pkexec.geany.policy](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/usr/share/polkit-1/actions/user.added.pkexec.geany.policy)

#### Bulk rename actions

Both these actions open the bulk rename utility GPrename - `apt install gprename`. One action is for a single folder selection to bulk rename files in that folder.
The other is for multiple selections and opens GPrename in the parent folder.

[bulk_rename_files.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/bulk_rename_files.nemo_action)

[bulk_rename_folders.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/bulk_rename_folders.nemo_action)

#### Creating links

An action and associated shell script to allow easy creation of symlinks to the target file/directory in a location of the users choice.
Uses zenity - `apt install zenity` to ask the user to confirm a destination directory and link name.

[create_link_in_target.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/create_link_in_target.nemo_action)

[create_link_in_target.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/create_link_in_target.sh)

#### Media info

Shows information about media files in a separate window. Requires mediainfo-gui - `apt install mediainfo-gui`.

[media-info.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/media-info.nemo_action)

#### Search folders

Opens the selected folder in Searchmonkey - `apt install searchmonkey` for more fine-tuned file system searches including search by contents.

[searchmonkey.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/searchmonkey.nemo_action)

#### View a tree-view directory structure in your browser

An action and associated shell script to produce an html tree-view of the directory and file structure below the selected directory. Requires tree - `apt install tree`

[print_tree.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/print_tree.nemo_action)

[print_tree.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/print_tree.sh)

#### Copy a random selection of files from a directory

Ever wanted to grab a random selection of music files or pictures from a collection? This action is for you. Uses zenity - `apt install zenity` to ask the user to confirm number of files and where to paste them.

[get_random_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/get_random_file.nemo_action)

[get_random_files.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/get_random_files.sh)

#### Toggle checked emblem

An action and associated shell script to quickly add or remove a ✓ emblem to the file/folder.

[toggle_checked.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/toggle_checked.nemo_action)

[toggle_checked.sh](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/toggle_checked.sh)

#### Update a files modification date

[touch_file.nemo_action](https://github.com/smurphos/nemo_actions_and_cinnamon_scripts/blob/master/nemo_actions/general_actions/touch_file.nemo_action)
