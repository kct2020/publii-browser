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
