# The basics
#
# Measure the size of a folder:
#
#     du -sh <folder_name>
#
# See the sizes of all the folders in the current directory (can take some time):
#
#     du -sk * | sort -n -k 1

# For Linux, see: stacer (logs and app caches) and bleachbit (cookies and journalctl)
# For Linux: rm -rf ~/.cache


# NPM and Yarn

# Caches
# If you use npm or yarn, and you don't mind it being slow the next time you run it
# ~/.npm/_cacache/
npm cache clean
# "$(yarn cache dir)"
yarn cache clean

# To clear old node_modules folders
#cd
# Largest first (quick)
#npx npkill -s size
# Alphabetically (thorough)
#npx npkill



# NVM (node version manager)
# The cache is not usually very big
# ~/.nvm/.cache/
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
rm -rf ~/.gradle



# Android development
## Virtual devices for the emulator
rm -rf ~/.android/avd/*



# Things installed by pip (python's package manager)
#rm -rf ~/.local/lib/python*.*/



# Docker
# Clear stopped containers and caches
docker system prune -f
# Remove all images and volumes except those used by running containers
#docker system prune --all
#
# Also check /var/lib/docker/volumes
# Some images store data here
# E.g. the mongo image with no arguments kept creating fresh new databases here, but never reusing them!
