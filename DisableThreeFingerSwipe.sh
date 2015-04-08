#!/bin/bash
#This script is made to disable the three finger swipe used for Mission Control and Screens.
#This is useful for schools environments during testing that requires systems to be locked down.

#Set arguements for script
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
loggedInUser=""
Mavericks=""
Yosemite=""

#Checks for OS X 10.9 and above and prints system is not supported
if [[ ${osvers} -lt 9 ]]; then

    echo This system is not supported.

fi

#Checks for match of OS X 10.9 and prints results afterwards
if [[ ${osvers} == 9 ]]; then

    loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
    sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerHorizGesture -int 0
    Mavericks=`sudo -u $loggedInUser defaults read com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerHorizGesture`
    echo $Mavericks

fi

#Checks for match of OS X 10.10 and prints results afterwards
if [[ ${osvers} == 10 ]]; then

    loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
    sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerDrag -boolean false
    Yosemite=`sudo -u $loggedInUser defaults read com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerDrag`
    echo $Yosemite

fi

exit

  
