#!/bin/bash

#disable startup network connectivity check
systemctl disable systemd-networkd.service

#rm unused apps
sudo apt purge --auto-remove \
    simple-scan gnome-calculator gnome-clocks \
    gnome-calendar libreoffice* remmina \
    transmission-gtk rhythmbox vim shotwell \
    gnome-snapshot totem evince gedit
sudo snap remove --purge thunderbird && \
    rm -rf ~/.thunderbird ~/.mozilla-thunderbird

sudo apt autoremove
sudo apt clean

#rm logs >1d
sudo journalctl --vacuum-time=1d
rm -rf ~/.cache/thumbnails/*

sudo apt install gh