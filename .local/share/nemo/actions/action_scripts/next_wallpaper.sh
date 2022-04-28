#!/bin/bash
if [ "$(gsettings get org.cinnamon.desktop.background.slideshow slideshow-enabled)" == false ]  ; then
  gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled true
fi
if [ "$(gsettings get org.cinnamon.desktop.background.slideshow slideshow-paused)" == true ] ; then
  gsettings set org.cinnamon.desktop.background.slideshow slideshow-paused false
fi
dbus-send --print-reply --dest=org.Cinnamon.Slideshow /org/Cinnamon/Slideshow org.Cinnamon.Slideshow.getNextImage

