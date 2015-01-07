#!/bin/sh

#This script is made to pull the given name from NetBIOSName.

#Sets scutil names according to NetBiosName
defaults=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName)

#Sets Names set by the NetBIOSName
scutil --set HostName $defaults
scutil --set ComputerName $defaults
scutil --set LocalHostName $defaults

#Prints set names to terminal
#At times scutil will not report the name correctly, this is to due with scutil
#If it does not report, you can manually run the commands below to ensure the name has been correctly set
scutil --get HostName
scutil --get ComputerName
scutil --get LocalHostName
