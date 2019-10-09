# The basics
# Measure the size of a folder:
#du -sh <folder_name>
# See the sizes of all the folders in the current directory:
#du -sk * | sort -n -k 1



# NPM and Yarn

# Caches
# If you use npm or yarn, and you don't mind it being slow the next time you run it
npm cache clean
yarn cache clean

# To clear old node_modules folders
#cd
# Quickly regain some space
#npx npkill -s size
# Go through the filesystem thoroughly
#npx npkill



# NVM (node version manager)
# The cache is not usually very big
nvm cache clear
# You can list all installed versions
#nvm ls
# And remove the ones you aren't using
#nvm rm <node_version>



# WebStorm
# If you have multiple folders matching ~/Library/Caches/WebStorm2019.* you can remove all but the last one.
# If you stop WebStorm, you can remove all of them.



# Xcode

# This should clear out ~/Library/Developer/CoreSimulator/Devices
# https://stackoverflow.com/questions/33419301/macos-xcode-coresimulator-folder-very-big-is-it-ok-to-delete-content
xcrun simctl delete unavailable

# These are only needed for symbolicate of devices you have plugged in
# https://stackoverflow.com/questions/29930198/can-i-delete-data-from-ios-devicesupport
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*

rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Archives of apps you have built
#rm -rf ~/Library/Developer/Xcode/Archives/*



# Cordova

rm -rf ~/.cordova/lib/tmp
rm -rf ~/.cordova/lib/npm_cache
