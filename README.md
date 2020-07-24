# portainer-systemd

A simple auto-updating systemd unit to run a local instance of Portainer on your host.


## Disclaimer

The simple scripts you can find on this repository have been created with the purpose of automating my own workflow. With multiple little servers around, every little thing that can be automated and can save me some time is helpful. I hope this is helpful for you too.
Feel free to contact me for issues, improvement requests, etc.


## Prerequisites

You need to have docker up and running on a linux machine.  
Unless you choose to use the "Installation without systemd", you obviously need to be running systemd.  

All of this has been tested on:

 - Raspberry Pi 3 running Raspian Buster
 - Debian Buster (x84_64)
 - Ubuntu 18.04 (x84_64)
 - Manjaro

As I test the unit and/or the scripts on more platforms, I will update this list.
You can alternatively execute the commands listed under "Manual Installation", "Automated Installation" or "Installation without systemd".


## Manual Installation

From the root directory of this repository, just copy the portainer.service file to /etc/systemd/system/portainer.service:

`sudo cp portainer.service /etc/systemd/system/portainer.service`

then run:

`sudo systemctl daemon-reload`

`sudo systemctl enable portainer`

`sudo systemctl start portainer`


## Automated Installation

From the root directory of this repository, just execute the convenience script:

`sudo sh install.sh`


## Checking service status with systemd

You can check if the service is running using the following:

`systemctl status portainer`

If everything went fine, systemd will report something like "Active: active (running)" Now you can just go to your brower at the URL:

    http://your-host:9000

Create the admin credentials on the first logon and start using the awesome Portainer.


## Updating with systemd

The latest version of the image will be pulled on every start of the service. The container is always recreated on the fly.
To update to the latest version of portainer, just login into Portainer itself, and simply stop the "portainer" container. Your action will trigger the systemd unit, which will automatically pull the latest image and recreate the container.

Alternatively, just restart the service by typing:

`sudo systemctl restart portainer`


## Installation without systemd

I have created a convenience script "run.sh" which automates the creation of the Portainer container in restart unless-stopped mode. No need for systemd with this method.
From the root directory of this repository, just execute the convenience script:

  `sudo sh run.sh`

This will create the "portainer" container for you. Such container will restart automatically unless you explicitly stop it.
Obviously it will restart on each reboot of your machine.

If you wish to add a container, which will be capable of auto-updating your containers, just execute the convenience script (always from the root of this repository):

  `sudo sh run-watchtower.sh`

Please note that watchtower will try to update all of your containers. If you want to limit the containers which will be automatically updated, edit the 'watchtower' container using Portainer, and under "Command and logging", in the texbox "Command", add a space-separated list of the containers you want to auto-update. Just to provide an example, a list could be like the following:

  `portainer syncthing influxdb grafana`

This method (without systemd) eliminates the 'weirdness' of having to stop the portainer container just to trigger its own updating and restart. If you can live with that, the systemd version should work just fine.

A quick note for the "watchtower" container: you might want to add the "TZ" environment variable according to your timezone (mine for example is "Europe/Rome"). Not mandatory, but this way the watchtower log will present you the timestamps expressed accordingly with your timezone.
