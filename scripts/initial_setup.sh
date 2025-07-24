#!/bin/bash

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
sudo nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#devm