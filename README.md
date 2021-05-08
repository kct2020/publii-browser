# gitpod-browser-demo
Contains the Gitpod configuration to launch a Firefox in Gitpod

Launch original repo in Gitpod: https://gitpod.io/#github.com/csweichel/gitpod-browser-demo

***
210507 Original README above (with name change for repo)

That link lets me run a browser in Gitpod, as per the conclusion of https://www.gitpod.io/blog/native-ui-with-vnc/. So I'm experimenting with that setup to see if I can install Publii. Because all my attempts to run the Linux install so far have failed - except [installing Publii on my own Chromebook](https://publii-book.pages.dev/welcome-to-publiibook/).

## Publii Linux Image Download
Branch gitpod-download. Because I am in the habit of creating a branch for Gitpod.

But Gitpod fails after Reading package lists...
E: List directory /var/lib/apt/lists/partial is missing. - Acquire (13: Permission denied)


Error: build failed: cannot build base image: The command '/bin/sh -c apt-get update     && apt-get install -y firefox matchbox twm     && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*' returned a non-zero code: 100

Search result https://github.com/SeleniumHQ/docker-selenium/issues/725 suggests adding sudo in docker file. So I'll try that.
***

Firefox - Preferences set to new folder \u2066/workspace/publii-browser/Downloads\u2069
Navigated to https://getpublii.com/download/ and downloaded Linux image
Signed up for newsletter that popped up after downloading.

In new terminal, followed instructions at https://publii-book.pages.dev/welcome-to-publiibook/ (adding sudo apt-get install -y gnome-keyring)

Got error:
'dlopen(): error loading libfuse.so.2

AppImages require FUSE to run. 
You might still be able to extract the contents of this AppImage 
if you run it with the --appimage-extract option. 
See https://github.com/AppImage/AppImageKit/wiki/FUSE 
for more information'

From that link, ran:
sudo apt install -y fuse
sudo modprobe fuse 
(but got sudo: modprobe: command not found so ran sudo apt install -y modprobe - giving E: Unable to locate package modprobe. Now, trying to run Publii, FUSE message changes to:
fusermount: mount failed: Invalid argument
Cannot mount AppImage, please check your FUSE setup.

So I'll stop here for investigation. )

sudo groupadd fuse
user="$(whoami)"
sudo usermod -a -G fuse $user

More trouble trying to push changes back to GitHub because Publii image download is too big. 

***
##Publii install from .deb?
- Downloaded Publii-0.38.2.deb
- Proceed with install skipping chmod and running ./Publii-0.38.2.deb
gives bash: ./Publii-0.38.2.deb: Permission denied
Then https://askubuntu.com/questions/319650/how-can-i-install-a-deb-file-from-command-line tells me that ".deb files are installed using the dpkg command.". So I'll try 
sudo dpkg -i Publii-0.38.2.deb

Giving...

Preparing to unpack Publii-0.38.2.deb ...
Unpacking publii (0.38.2) ...
dpkg: dependency problems prevent configuration of publii:
 publii depends on libnotify4; however:
  Package libnotify4 is not installed.
 publii depends on libnss3; however:
  Package libnss3 is not installed.
 publii depends on xdg-utils; however:
  Package xdg-utils is not installed.
 publii depends on libappindicator3-1; however:
  Package libappindicator3-1 is not installed.

dpkg: error processing package publii (--install):
 dependency problems - leaving unconfigured
Processing triggers for mime-support (3.64ubuntu1) ...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Errors were encountered while processing:
 publii

I'm going to have a break!
***
##Add Publii dependencies to Docker
Plan now is to get as much into config files as possible so that the manual procedure is minimal. But first, I'm going back to the previous Gitpod workspace to see if the Publii-0.38.2.deb download will push from Gitpod to GitHub. And that worked! So time to start another Gitpod session.

***

##Second Publii install from .deb attempt
