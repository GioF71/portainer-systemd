# portainer-systemd

A simple auto-updating systemd unit to run a local instance of Portainer on your host.


**Prerequisites**

You need to have docker up and running on a linux machine running systemd.
The service has been tested on:

 - Raspberry Pi 3 running Raspian Buster
 - Debian Buster (x84_64)
 - Ubuntu 18.04 (x84_64)
 - Manjaro

As I test the unit on more platforms, I will update this list.


**Manual Installation**

From the root directory of this repository, just copy the portainer.service file to /etc/systemd/system/portainer.service:

`sudo cp portainer.service /etc/systemd/system/portainer.service`

then run:

`sudo systemctl daemon-reload`

`sudo systemctl enable portainer`

`sudo systemctl start portainer`


**Automated Installation**

From the root directory of this repository, just execute the convenience script:

`sudo sh install.sh`

**Usage**

You can check if the service is running using the following:

`systemctl status portainer`

If everything went fine, systemd will report something like "Active: active (running)" Now you can just go to your brower at the URL:

    http://your-host:9000

Create the admin credentials on the first logon and start using the awesome Portainer.


**Updating**

The latest version of the image will be pull on every start of the service. The container is always created on the fly.
To update to the latest version of portainer, just login into Portainer itself, and simply stop the "Portainer" container. Systemd will then pull the latest image and recreate the container automatically.

Alternatively, just restart the service by typing:

`sudo systemctl restart portainer`
 
