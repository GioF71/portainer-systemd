# portainer-systemd
A simple auto-updating systemd unit to run Portainer

Prerequisites
You need to have docker up and running
The service has been tested on
  Rasperry Pi 3 running Raspian buster
  Debian Buster (x84_64)
  Ubuntu 18.04 (x84_64)
As I test more platform, I will report the results here.

Instructions
Just copy the service file to /etc/systemd/system/portainer.service, then run:

sudo systemctl daemon-reload
sudo systemctl enable portainer
sudo systemctl start portainer

You can see if everything is running by running:

systemctl status portainer

If everything went fine, systemd will report something like "Active: active (running)"
Now you can just go to your brower at the URL

http://your-host:9000

Create the admin credentials on the first logon and start using the awesome Portainer.
