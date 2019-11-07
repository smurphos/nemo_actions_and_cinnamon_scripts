#!/bin/bash
# Only allow script to run in a terminal
if [ ! -t 1 ]; then
  notify-send "${0##*/} must be run in a terminal"
  exit 1
fi

# Check patch files are present
if [ ! -f ./fileUtils_3.0_0.1.patch ] || [ ! -f ./fileUtils_3.4_0.1.patch ] || [ ! -f ./fileUtils_3.8_0.1.patch ] || [ ! -f ./placesManager_3.0_0.1.patch ] || [ ! -f ./placesManager_3.4_0.1.patch ]; then
  notify-send "Error - Could not locate one or more patch files. Aborting"
  exit 1
fi

# Set up to request credentials if needed
SUDO=''
if [ $EUID != 0 ]; then
  SUDO='sudo'
fi

# Get cinnamon-version
if ! cinnamon --version; then
  echo "Error - could not determine Cinnamon version. Aborting script"
  exit 1
else
  CIN_VERSION=$(cinnamon --version | cut -d" " -f2)
  if [ "$CIN_VERSION" == "4.2.4" ]; then
    MD5_FILEUTILS="c83ac8210ab70da0f0b044aa472fa150"
    MD5_PLACESMANAGER="07187e580dbe8341815bd1c7533da713"
    MD5_MENUAPPLET="5c1c2b3e08b188031d65b4b3f8b9d87c"
  elif [ "$CIN_VERSION" == "4.0.10" ]; then
    MD5_FILEUTILS="c83ac8210ab70da0f0b044aa472fa150"
    MD5_PLACESMANAGER="07187e580dbe8341815bd1c7533da713"
    MD5_MENUAPPLET="96c45e9af184018085aa07af30b55ccf"
  elif [ "$CIN_VERSION" == "3.8.9" ]; then
    MD5_FILEUTILS="c83ac8210ab70da0f0b044aa472fa150"
    MD5_PLACESMANAGER="07187e580dbe8341815bd1c7533da713"
    MD5_MENUAPPLET="857a2d988a12cc90f890cc8c2b8f51fd"
  elif [ "$CIN_VERSION" == "3.6.7" ]; then
    MD5_FILEUTILS="f4c8f33218eacb06bda44bfc3f487f2a"
    MD5_PLACESMANAGER="07187e580dbe8341815bd1c7533da713"
    MD5_MENUAPPLET="c66b789a08d5039e37973dbab10411e8"
  elif [ "$CIN_VERSION" == "3.4.6" ]; then
    MD5_FILEUTILS="f4c8f33218eacb06bda44bfc3f487f2a"
    MD5_PLACESMANAGER="07187e580dbe8341815bd1c7533da713"
    MD5_MENUAPPLET="8c1ae097ecb174956774ec4a33847257"
  elif [ "$CIN_VERSION" == "3.2.7" ]; then
    MD5_FILEUTILS="41556e0c2e43324baae39aa30c0a2515"
    MD5_PLACESMANAGER="5b117bffdcefc181504683fff19d670b"
    MD5_MENUAPPLET="50b5b8df90c3cf22c5371dea972f15e5"
  elif [ "$CIN_VERSION" == "3.0.7" ]; then
    MD5_FILEUTILS="b7c8f816a64658d86f4a2724850fae1d"
    MD5_PLACESMANAGER="a03a22a300574a05fbbcf6f566c3d297"
    MD5_MENUAPPLET="ec95d40fcbe85ca82cbf11ac42b77ed3"
  else
    echo "This script does not support patching or reverting Cinnamon version $CIN_VERSION"
    echo "Please check https://github.com/smurphos/nemo_actions_and_cinnamon_scripts for an updated version of the script,"
    echo "or raise an issue at https://github.com/smurphos/nemo_actions_and_cinnamon_scripts"
    exit 1
  fi
fi

# Functions

function apply_patches {
  # Patch menu@cinnamon.org of not already patched against current version.
  if grep -q "// Patched by cinnamon_patcher_0.1.sh" /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js; then
    echo "menu@cinnamon.org is already patched. Skipping."
  # Is the original menu@cinnamon.org present - if so patch.
  elif [ "$(md5sum /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js | cut -d" " -f1)" == "$MD5_MENUAPPLET" ]; then
    $SUDO cp -fr /usr/share/cinnamon/applets/menu@cinnamon.org "/usr/share/cinnamon/applets/menu@cinnamon.org.$MD5_MENUAPPLET"
    $SUDO sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
    $SUDO sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
    echo "Patched menu@cinnamon.org"
  # If not is there a backup of the original? If so restore the backup and then repatch.
  elif [ -d "/usr/share/cinnamon/applets/menu@cinnamon.org.$MD5_MENUAPPLET" ]; then
    $SUDO cp -fr "/usr/share/cinnamon/applets/menu@cinnamon.org.$MD5_MENUAPPLET"  /usr/share/cinnamon/applets/menu@cinnamon.org
    $SUDO sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
    $SUDO sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
    echo "Patched menu@cinnamon.org" 
  else
    echo "Could not patch menu@cinnamon.org. Existing file and/or it's backup is not the expected version"   
  fi
  # Patch CinnVIIStarkMenu@NikoKrause if present
  if [ -d ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause ]; then
    if grep -q "// Patched by cinnamon_patcher_0.1.sh" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/3.4/applet.js; then
      echo "CinnVIIStarkMenu@NikoKrause is already patched. Skipping."
    else
      sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/3.4/applet.js
      sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/3.4/applet.js
      sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/3.2/applet.js
      sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/3.2/applet.js
      sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/2.6/applet.js
      sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause/2.6/applet.js
      echo "Patched CinnVIIStarkMenu@NikoKrause"
    fi
  fi
  # Patch Cinnamenu@json if present
  if [ -d ~/.local/share/cinnamon/applets/Cinnamenu@json ]; then
    if grep -q "// Patched by cinnamon_patcher_0.1.sh" ~/.local/share/cinnamon/applets/Cinnamenu@json/4.0/buttons.js; then
      echo "Cinnamenu@json is already patched. Skipping."
    else
      sed -i "s|const USER_DESKTOP_PATH = getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" ~/.local/share/cinnamon/applets/Cinnamenu@json/4.0/buttons.js
      sed -i "s|USER_DESKTOP_PATH|getUserDesktopDir()|g" ~/.local/share/cinnamon/applets/Cinnamenu@json/4.0/buttons.js
      sed -i "s|const USER_DESKTOP_PATH = FileUtils.getUserDesktopDir();|// Patched by cinnamon_patcher_0.1.sh|g" ~/.local/share/cinnamon/applets/Cinnamenu@json/3.2/buttons.js
      sed -i "s|USER_DESKTOP_PATH|FileUtils.getUserDesktopDir()|g" ~/.local/share/cinnamon/applets/Cinnamenu@json/3.2/buttons.js
      echo "Patched Cinnamenu@json"
    fi
  fi
  # Patch fileUtils.js if not already patched
  if grep -q "// Patched by fileUtils_*_0.1.patch" /usr/share/cinnamon/js/misc/fileUtils.js; then
    echo "fileUtils.js is already patched. Skipping."
  # Is the original fileUtils.js present - if so patch
  elif [ "$(md5sum /usr/share/cinnamon/js/misc/fileUtils.js | cut -d" " -f1)" == "$MD5_FILEUTILS" ]; then
    $SUDO cp -f /usr/share/cinnamon/js/misc/fileUtils.js "/usr/share/cinnamon/js/misc/fileUtils.js.$MD5_FILEUTILS"
    if [ "$CIN_VERSION" == "3.0.7" ] || [ "$CIN_VERSION" == "3.2.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileUtils_3.0_0.1.patch"
    elif [ "$CIN_VERSION" == "3.4.6" ] || [ "$CIN_VERSION" == "3.6.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileUtils_3.4_0.1.patch"
    else
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileutils_3.8_0.1.patch"
    fi
    echo "Patched fileUtils.js"
  # If not try restoring the backup and repatching.
  elif [ -f "/usr/share/cinnamon/js/misc/fileUtils.js.$MD5_FILEUTILS" ]; then
    $SUDO cp -f "/usr/share/cinnamon/js/misc/fileUtils.js.$MD5_FILEUTILS" /usr/share/cinnamon/js/misc/fileUtils.js
    if [ "$CIN_VERSION" == "3.0.7" ] || [ "$CIN_VERSION" == "3.2.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileUtils_3.0_0.1.patch"
    elif [ "$CIN_VERSION" == "3.4.6" ] || [ "$CIN_VERSION" == "3.6.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileUtils_3.4_0.1.patch"
    else
      $SUDO patch /usr/share/cinnamon/js/misc/fileUtils.js < "$PWD/fileutils_3.8_0.1.patch"
    fi
    echo "Patched fileUtils.js"
  else
    echo "Could not patch fileUtils.js. Existing file and/or it's backup is not the expected version"   
  fi
  # Patch placesManager.js if not already patched
  if grep -q "// Patched by placesManager_*_0.1.patch" /usr/share/cinnamon/js/ui/placesManager.js; then
    echo "placesManager.js is already patched. Skipping."
  # Is the original placesManager.js present - if so patch
  elif [ "$(md5sum /usr/share/cinnamon/js/ui/placesManager.js | cut -d" " -f1)" == "$MD5_PLACESMANAGER" ]; then
    $SUDO cp -f /usr/share/cinnamon/js/ui/placesManager.js "/usr/share/cinnamon/js/ui/placesManager.js.$MD5_PLACESMANAGER"
    if [ "$CIN_VERSION" == "3.0.7" ] || [ "$CIN_VERSION" == "3.2.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/ui/placesManager.js < "$PWD/placesManager_3.0_0.1.patch"
    else
      $SUDO patch /usr/share/cinnamon/js/ui/placesManager.js < "$PWD/placesManager_3.4_0.1.patch"
    fi    
    echo "Patched placesManager.js"
  # If not try restoring the backup and repatching.
  elif [ -f "/usr/share/cinnamon/js/ui/placesManager.js.$MD5_PLACESMANAGER" ]; then
    $SUDO cp -f "/usr/share/cinnamon/js/ui/placesManager.js.$MD5_PLACESMANAGER" /usr/share/cinnamon/js/ui/placesManager.js 
    if [ "$CIN_VERSION" == "3.0.7" ] || [ "$CIN_VERSION" == "3.2.7" ]; then
      $SUDO patch /usr/share/cinnamon/js/ui/placesManager.js < "$PWD/placesManager_3.0_0.1.patch"
    else
      $SUDO patch /usr/share/cinnamon/js/ui/placesManager.js < "$PWD/placesManager_3.4_0.1.patch"
    fi    
    echo "Patched placesManager.js"   
  else
    echo "Could not patch placesManager.js. Existing file and/or it's backup is not the expected version"   
  fi
  echo "Please press Ctrl-Alt-Esc to restart Cinnamon and reload the patched components"
}

function revert_patches {
  # Revert menu@cinnamon.org patch
  if [ -d "/usr/share/cinnamon/applets/menu@cinnamon.org.$MD5_MENUAPPLET" ]; then
    $SUDO rm -r /usr/share/cinnamon/applets/menu@cinnamon.org
    $SUDO mv -f "/usr/share/cinnamon/applets/menu@cinnamon.org.$MD5_MENUAPPLET" /usr/share/cinnamon/applets/menu@cinnamon.org
    echo "Reverted menu@cinnamon.org to original version"
  elif [ "$(md5sum /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js | cut -d" " -f1)" == "$MD5_MENUAPPLET" ]; then
    echo "menu@cinnamon.org is already the original version. Nothing to do"
  else
    echo "Error - could not find a backup of original menu@cinnamon.org for Cinnamon version $CIN_VERSION to restore"
    FAILURE=true
  fi
  # Revert CinnVIIStarkMenu@NikoKrause patch if present by downloading and installing current version from Cinnamon Spices.
  if [ -d ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause ]; then
    rm -r ~/.local/share/cinnamon/applets/CinnVIIStarkMenu@NikoKrause
    WORKDIR="$PWD"
    cd ~/.local/share/cinnamon/applets/ || return
    wget -q https://cinnamon-spices.linuxmint.com/files/applets/CinnVIIStarkMenu@NikoKrause.zip
    unzip -q CinnVIIStarkMenu@NikoKrause.zip
    rm CinnVIIStarkMenu@NikoKrause.zip
    cd "$WORKDIR" || return
    echo "CinnVIIStarkMenu@NikoKrause restored to current version from Cinnamon Spices"
  fi
  # Revert Cinnamenu@json patch if present by downloading and installing current version from Cinnamon Spices.
  if [ -d ~/.local/share/cinnamon/applets/Cinnamenu@json ]; then
    rm -r ~/.local/share/cinnamon/applets/Cinnamenu@json
    WORKDIR="$PWD"
    cd ~/.local/share/cinnamon/applets/ || return
    wget -q https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip
    unzip -q Cinnamenu@json.zip
    rm Cinnamenu@json.zip
    cd "$WORKDIR" || return
    echo "Cinnamenu@json restored to current version from Cinnamon Spices"
  fi
  # Revert fileUtils.js patch
  if [ -f "/usr/share/cinnamon/js/misc/fileUtils.js.$MD5_FILEUTILS" ]; then
    $SUDO mv -f "/usr/share/cinnamon/js/misc/fileUtils.js.$MD5_FILEUTILS" /usr/share/cinnamon/js/misc/fileUtils.js
    echo "Reverted fileUtils.js to original version."
  elif [ "$(md5sum /usr/share/cinnamon/js/misc/fileUtils.js | cut -d" " -f1)" == "$MD5_FILEUTILS" ]; then
    echo "fileUtils.js is already the original version. Nothing to do"
  else
    echo "Error - could not find a backup of original fileUtils.js for Cinnamon version $CIN_VERSION to restore."
    FAILURE=true
  fi
  # Revert placesManager.js patch
  if [ -f "/usr/share/cinnamon/js/ui/placesManager.js.$MD5_PLACESMANAGER" ]; then
    $SUDO mv -f "/usr/share/cinnamon/js/ui/placesManager.js.$MD5_PLACESMANAGER" /usr/share/cinnamon/js/ui/placesManager.js
    echo "Reverted placesManager.js to original version."
  elif [ "$(md5sum /usr/share/cinnamon/js/ui/placesManager.js | cut -d" " -f1)" == "$MD5_PLACESMANAGER" ]; then
    echo "placesManager.js is already the original version. Nothing to do"
  else
    echo "Error - could not find a backup of original placesManager.js for Cinnamon version $CIN_VERSION to restore."
    FAILURE=true
  fi
  if [ "$FAILURE" == "true" ]; then
    echo "One or more errors was encountered reverting patches to Cinnamon components. Suggested remedy is to use your package manager to reinstall the package cinnamon-common"
    echo "E.g for a Ubuntu / Debian / Mint  based system open a terminal and run:"
    echo "sudo rm -r /usr/share/cinnamon/applets/menu@cinnamon.org"
    echo "sudo rm /usr/share/cinnamon/js/misc/fileUtils.js"
    echo "sudo rm /usr/share/cinnamon/js/ui/placesManager.js"
    echo "sudo apt install --reinstall cinnamon-common"
    echo "For other distros replace the sudo apt install command with the equivalent for your distros package management system."       
  fi
  echo "Please press Ctrl-Alt-Esc to restart Cinnamon and reload the reverted components"
}

# Dialogue

echo "Do you want to apply or revert patches to Cinnamon components to support multiple desktop folders?"
echo "Please select your choice."
OPTIONS=("Apply Patches" "Revert Patches" "Abort Script")
select CHOICE in "${OPTIONS[@]}";
do
    case $CHOICE in 
    "Apply Patches")
		apply_patches;;
    "Revert Patches")
		revert_patches;;
	"Abort Script")
		cd || exit; exit;;
    *) echo ""; echo "Invalid option. Try another one."; echo ""; continue;;
    esac
    break
done
exec "$SHELL"
