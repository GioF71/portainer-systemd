# portainer-systemd

A simple auto-updating systemd unit to run a local instance of Portainer on your host.


**Prerequisites**

You need to have docker up and running on a linux machine running systemd.
The service has been tested on:

 - Rasperry Pi 3 running Raspian Buster
 - Debian Buster (x84_64)
 - Ubuntu 18.04 (x84_64)

As I test more platforms, I will update the results.


**Instructions**

From the root directory of this repository, just copy the portainer.service file to /etc/systemd/system/portainer.service:

`sudo cp portainer.service /etc/systemd/system/portainer.service`

then run:

`sudo systemctl daemon-reload`

`sudo systemctl enable portainer`

`sudo systemctl start portainer`


**Usage**

You can see if everything is running by running:

`systemctl status portainer`

If everything went fine, systemd will report something like "Active: active (running)" Now you can just go to your brower at the URL:

    http://your-host:9000

Create the admin credentials on the first logon and start using the awesome Portainer.
