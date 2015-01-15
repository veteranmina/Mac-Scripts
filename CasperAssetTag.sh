#This script is made to read the NetBIOSName of the mac and then use it to update the assettag in Casper.
#It is also made to report the NetBIOSName for logging purposes in the Casper logs.

#!/bin/sh

asset=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName)

echo "$asset"

jamf recon -verbose -assetTag "$asset"
