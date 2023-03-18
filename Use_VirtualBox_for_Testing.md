## Abstract

This is a guide for developers on macOS or Linux who need to test a Windows app they have built.

## Prerequisites

Install vagrant and VirtualBox

## Get started

```
mkdir vagrant_win2012
cd vagrant_win2012

# Download the image
# You may of course choose to install a different Windows image from here:
# https://app.vagrantup.com/boxes/search
# This one needs 5GB disk space
vagrant init opentable/win-2012r2-standard-amd64-nocm

# Start it running
# Needs 10GB disk space
vagrant up
```

This starts the machine running but in the background (headless).

Open VirtualBox.  You should be able to click to `Show` the running machine.

## Save a snapshot

Before messing up this machine, let's first save a nice clean snapshot.

1. Click through any initial setup wizards, to get the machine into a nice state

2. Click `Machine > Take Snapshot`

## Close the machine

Do anything you want on the machine, make a mess.  Then do the following, which will forget your changes:

1. Select `File > Close` (or hit the window's close button)

2. Select `Power off the machine` and also `Restore current snapshot`

Why?

- We don't want the remember/store the _current_ messy state of the machine, because we are going to use the clean snapshot in future.  (This allows us to test repeatedly, starting with a clean install each time.)

- The next time we start the machine, we don't want to wait while it boots up.  It will start immediately in the snapshot state, which is faster than a full boot.

- Starting from an early snapshot also means our virtual machine won't slowly grow in size over time.

(You can manage snapshots from the ≡ menu by each machine in the main VirtualBox Manager window.)

## Use the machine for testing

You can use this process to build `.exe` files on your host machine, and test them in the virtual machine.

1. Open the virtual machine.  Open the File Manager and navigate to `Network > \\VBOXSVR\Vagrant`

   This folder corresponds to `vagrant_win2012/` on your host machine (the first folder you created).

   (I like to make a shortcut to this folder, and save that in a Snapshot.)

2. On your host machine, drop a file into `vagrant_win2012/`

3. On the virtual machine, press `F5` to refresh the File Manager.  You should see your file appear.

4. Run your file inside the virtual machine.

## Folders and space

Vagrant will download the initial image to:

```bash
du -sh ~/.vagrant.d/
```

VirtualBox will store the disk image and snapshots in:

```bash
du -sh ~/VirtualBox VMs/
```

If you don't plan to use vagrant again after the initial download, you could remove the folder `~/.vagrant.d/boxes` or the entire thing.
