# DeskCluster

Ansible Playbook for my Desktop Raspi Cluster

## Hardware

## Pre-Requisites

1. Followed the Arch Linux AARCH64 installation instructions [here](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4).
2. Before unmounting each sdcard, edited the new systems
  `/etc/systemd/network/eth.network` to contain a 0-4 address like the example below.
3. Addresses were determined by running `sudo nmap -sL X.X.X.X\X`
  to find an appropriate address block since I do not have control over my dhcp server.
4. Because I am running on AARCH64, in order for me to run molecule tests
  I needed to obtain a AARCH64 docker image of ArchLinux. Unfortunately, the images
  that exist seem either sketchy, or are woefully outdated. That is why I have
  created my own image based on a (well built) outdated one I found on
  dockerhub. To build this image, in the root context of this repo,
  run `docker build -t bubba/archlinux:aarch64 .`.
5. Copy ssh keys to hosts via `ssh-copy-id alarm@host`. The ArchLinux AARCH64
  image does not have ssh-keypass installed, thus ansible will not run with passwords.
6. The images do not have a python interpreter installed. It is nessicary to
  log into each node to update the os and install python. REMEMBER: run
  `pacman-key --init` and `pacman-key --populate archlinuxarm` before running updates.
7. Because the default `alarm` user does not have sudo rights, first run
  this: `ansible-playbook -i hosts.ini site.yml -u alarm --become-method=su -K
  --tags first_run`.
  This will add a user with sudo rights, ssh keys, etc.
8. After the first run, this command will run the rest of the playbook:
  `ansible-playbook -i hosts.ini site.yml -u bubba`. "Bubba" is the user
  that is set by default.

### Static IP Address Example

```ini
[Match]
Name=eth*

[Network]
Address=10.1.10.9/24
Gateway=10.1.10.1
DNS=10.1.10.1
#DNS=8.8.8.8
```
