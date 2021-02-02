# DeskCluster

Ansible Playbook for my Desktop Raspi Cluster

## Hardware

## Pre-Requisites

1. Followed the Arch Linux AARCH64 installation instructions [here](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4).
2. Before unmounting each sdcard, edited the new systems
  `/etc/systemd/network/eth.network` to contain a 0-4 address variant of:

```ini
[Match]
Name=eth*

[Network]
Address=10.1.10.9/24
Gateway=10.1.10.1
DNS=10.1.10.1
#DNS=8.8.8.8
```

2.1. Addresses were determined by running `sudo nmap -sL X.X.X.X\X`
  to find an appropriate address block since I do not have control over my dhcp server.
