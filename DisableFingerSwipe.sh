#!/bin/bash
#This Script is made to disable all Swipe gestures besides two finger gestures.
#This was mainly made so students cannot get out of MAP testing applications during the test.

#Set arguements for script
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
loggedInUser=""

#Writes current user that is logged-in into terminal
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

#Sets defaults for Trackpad Three swipe to false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerHorizGesture -boolean false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerVertGesture -boolean false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerDrag -boolean false

#Sets defaults for Trackpad Three tap gesture (Dictonary use that is not allowed during testing)
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerTapGesture -boolean false

#Sets defaults for Trackpad Four swipe to false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerHorizGesture -boolean false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerVertGesture -boolean false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerDrag -boolean false

#Sets defaults for Trackpad Five swipe to false
sudo -u $loggedInUser defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFiveFingerPinchGesture -boolean false

#Prints results to terminal

