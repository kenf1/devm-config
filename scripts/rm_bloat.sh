#!/bin/bash

sudo apt remove vim && apt autoremove && \
    apt-get remove --purge libreoffice\* && \
    apt-get purge --auto-remove remmina transmission-gtk rhythmbox && \
    apt-get clean && apt-get autoremove && \
    snap remove --purge thunderbird
rm -rf ~/.thunderbird ~/.mozilla-thunderbird

#rm logs >1d
sudo journalctl --vacuum-time=1d